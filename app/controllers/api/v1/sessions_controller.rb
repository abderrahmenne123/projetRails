class API::V1::SessionsController < Devise::SessionsController

    prepend_before_action :require_no_authentication, :only => [:create]
    #include Devise::Controllers::InternalHelpers
    before_action :ensure_params_exist
    
    respond_to :json
    
    def profile
      #build_resource
      #_wrap_parameters :user
      resource = User.find_for_database_authentication(:id => current_user.id.to_s)
      logger.debug { resource.inspect }
      return invalid_login_attempt unless resource
  
      
        
        render :json=> {:success=>true,  :email=>resource.email, :firstname=> resource.firstname}
        return
  
   
  end

    def create
        #build_resource
        #_wrap_parameters :user
        resource = User.find_for_database_authentication(:email=>params[:user_login])
        #logger.debug { resource.inspect }
        return invalid_login_attempt unless resource
    
        if resource.valid_password?(params[:password])
          sign_in(:user, resource)
         render :json=> {:success=>true, :auth_token=>resource.authentication_token, :password=>resource.password, :email=>resource.email, :firstname=> resource.firstname}
       #byebug
        # render :json => {:user =>resource}
         return
        end
        invalid_login_attempt
    end
    
    def destroybuild_resource
        sign_out(resource_name)
    end
    
      protected
      def ensure_params_exist
        #_wrap_parameters :user
        return unless params[:user_login].blank?
        render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
      end
    
      def invalid_login_attempt
        warden.custom_failure!
        render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
      end
end