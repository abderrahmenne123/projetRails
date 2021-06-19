Rails.application.routes.draw do
  #get 'users/index'
  #get 'users/show'
 # get 'users/edit'
  # root html
 devise_for :users


 #resources :users, only: [:new, :index, :show, :edit, :update, :destroy]
 #resources :admin, only: [:index, :show, :edit, :update]
 root  'home#index'
 #devise_for :users
  #
  #
 resources :conversations do
  resources :messages 
  
 end

  resources :users, only: [:new, :index, :show, :edit, :update, :destroy] do
    #get '/private', to: 'home#private'

  end
post 'create_user' => 'users#create', as: :create_user
  resources :jobs

  resources :plannings
  resources :jobprofiles do
     resources :comments
     #post '/demandes', to: 'demandes#create'

     #get '/demandes/new', to: 'demandes#new'

    #get '/planning' , to: 'plannings#show'
     resources :demandes

  end
  resources :demandes do
    # get '/' , to:'demandes#rejeter'
    get '/demandesrejeter' , to: 'demandes#listerefuser'
  end
  get '/demandes/:id/accepter', to: 'demandes#accepter', as: 'demandeaccepter'
  get '/demandes/:id/refuser', to: 'demandes#refuser', as: 'demanderefuser'

  get '/listeaccepter', to: 'demandes#listeaccepter', as: 'demandelisteaccepter'
  get '/listerefuser', to: 'demandes#listerefuser', as: 'demandelisterefuser'

  # root to: 'home#index'
  #get '/demandeparuser' , to: 'demandes#demandeparuser'
  #
  #
  get 'home/private'
  get 'homepage/index'
  get 'errors/404', to: 'errors#not_found'









  # root consacre pour la partie api de mobile rails
 namespace :api, defaults: {format: 'json'} do
  namespace :v1 do
    resources :jobprofiles
    get '/demandes/:id/accepter', to: 'demandes#accepter'
get '/demandes/:id/refuser', to: 'demandes#refuser'
      resources :jobs;
      resources :users;

      resources :demandes;

      #devise_for :users
      devise_for(:users, :controllers => { :sessions => "api/v1/sessions", :registrations => "api/v1/registration"})
      devise_scope :user do
        
       # post "/sign_in", :to => 'sessions#create'
       # post "/sign_up", :to => 'registrations#create'
        delete "/sign_out", :to => 'sessions#destroy'
        get "/profile", :to => 'sessions#profile'
      end
  end

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
