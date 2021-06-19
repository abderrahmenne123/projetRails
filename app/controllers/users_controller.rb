class UsersController < ApplicationController
  before_action :authenticate_user!,:set_user, only: [:show, :edit, :update, :destroy]
  #authorize_resource

  def new
    @user = User.new
    
    
  end
  
  
  def index
    #authorize_resource
   # authorize! :manage, :User
    
   
    if current_user.role == 'supadmin'

        #redirect_to @user
        @users = User.page(params[:page]).search(params[:search])
        #redirect_to @users
      else
      
        redirect_to errors_404_url
      
    
    
  end
  end
  def create
    u = User.new(user_params)

    # respond_to do |format|
    u.save!(:validate=>false)
    
    #     format.html { redirect_to @user, notice: "User was successfully created." }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
    #redirect_to :action => "devise/registrations#create"
    redirect_to root_path
  end
  def show
   # @user = User.find(params[:id])
  end

  def edit
   # @user = current_user
  end
  def update
    respond_to do |format|
    if @user.update(user_params)
      format.html{redirect_to users_url, notice:'accepte modificate'}
    else
      format.html{ render :edit}
    end
   end
  end
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private

  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(
      :firstname,
      :lastname,
      :avatar,
      :email,
      :mobile,
      :password,
      :password_confirmation,
      :role
    )
  end
end
