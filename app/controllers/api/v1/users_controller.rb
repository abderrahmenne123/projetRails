class API::V1::UsersController < ApplicationController
    include ActionController::Serialization
    def index
        @users = User.all
        puts @users.inspect
        render json:  @users, status: :ok

       # logger.debug { @users.inspect }
        #byebug
    end
    def create

    end
    def update

    end
    def destroy

    end
    def show

    end
end
