class JobprofilesController < ApplicationController
    before_action :authenticate_user!, :set_job,  only: [:show, :edit, :update, :destroy]
    #authorize_resource
    def new
        @jobprofile = Jobprofile.new
      
    end

    def index
      #authorize_resource
      # authorize! :manage, :User
      if current_user.role == 'client'


        @jobprofiles =  Jobprofile.page(params[:page]).recherche_mot(params[:recherche_mot])
      else
        if current_user.role == 'supadmin'
          @jobprofiles =  Jobprofile.page(params[:page]).recherche_mot(params[:recherche_mot])
        end
        if  current_user.role == 'technicien'
          @jobprofiles = Jobprofile.where(user_id: current_user.id).recherche_mot(params[:recherche_mot])
        end
      end

    end
    def create
      @jobprofile = Jobprofile.new(user_params)
     #@user = User.
      #@jobprofile = Jobprofile.where("user_id = ", User...)
      respond_to do |format|
        if @jobprofile.save
          format.html { redirect_to @jobprofile, notice: "User was successfully created." }

          format.json { render :show, status: :created, location: @jobprofile }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @jobprofile.errors, status: :unprocessable_entity }
        end
      end
    end
    def show
      if @jobprofile.comments.blank?
        @average_review = 0
      else
        @average_review = @jobprofile.comments.average(:rating).round(2)
      end
      @plannings = Planning.where(:user_id == @jobprofile.user_id)

    end
  
    def edit
     # @user = current_user
    end
    def update
      respond_to do |format|
      if @jobprofile.update(user_params)
        format.html{redirect_to @jobprofile, notice:'accepte modificate'}
      else
        format.html{ render :edit}
      end
     end
    end
    def destroy
      @jobprofile.destroy
      respond_to do |format|
        format.html { redirect_to jobprofiles_url, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    end
    def profileparuser
      
      @jobprofiles = Jobprofile.where(:user_id => User.id)
      format.html{ render :@jobprofiles}
     end 
     
    private
  
    def set_job
      @jobprofile = Jobprofile.find(params[:id])
    end
    
    def user_params
      params.require(:jobprofile).permit(
        :adresse,
        :ville,
        :tarif,
        :user_id,
        :namejob,
        :latitude,
        :langitude,
        :recherche_mot,
        gallery: []
        
      )
    end
 
end