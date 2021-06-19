class API::V1::JobprofilesController < ApplicationController
  include ActionController::Serialization
  before_action :set_jobprofile, only: [:show, :edit, :update, :destroy]
    def index
      @jobprofiles = Jobprofile.all

      # puts @jobprofiles.inspect
      render json: {
        status: :ok,
        message:"liste des jobProfiles",

      }


    end
  def create
    @jobprofile =Jobprofile.new(jobprofiler_params)
    if @jobprofile.save
      puts @jobprofile.inspect
      render json:{jobprofiles: @jobprofile, status: :created,message:"liste des jobsprofile"}
    else
      render json: @jobprofile.errors, status:  :unprocessable_entity
    end
  end
    def update

    end
    def destroy

    end
    def show
      render json:@jobprofile
    end
    private
    def set_jobprofile
      @jobprofile = Jobprofile.find(params[:id])
    end
    def jobprofiler_params
      params.require(:jobprofile).permit(
        :adresse,
        :ville,
        :tarif,
        :user_id,
        :namejob,
        gallery: []

      )
    end
end