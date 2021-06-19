class API::V1::RegistrationsController < Devise::RegistrationsController

    respond_to :json
    
    def create
 # byebug
    user = User.new(user_params)
    
    if user.save
    
    render :json => user.as_json(:auth_token=>user.authentication_token, :email => user.email ), :status=>201,users: user
   #format.json { render :show, status: :created, location: @user }
   # byebug
    return
    
    else
    
    warden.custom_failure!
    
    render :json => user.errors, :status=>422
    
    end
    
    end
    
    private
    
    def user_params
    
    #params.require(:user).permit(:email,:password,:password_confirmation,:mobile,:name)
    params.require(:user).permit(
        :email,
        :firstname,
        :lastname,
        :role,
        :mobile,
        :password,
        :password_confirmation,
       
      )
    end
    
end