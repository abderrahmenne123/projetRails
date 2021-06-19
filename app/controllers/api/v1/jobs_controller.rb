class API::V1::JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
    def index
        @jobs = Job.all
      # render json: @jobs, status: :ok
      render json: {
        status: :ok,
        message:"liste des jobs",
        jobs: @jobs
      }
          
            # format.json { render :json =>  @jobs.to_json, :status => :ok }
       
    end
    def create
      @job =Job.new(job_params)
      if @job.save 
        render json:{jobs: @job, status: :created,message:"liste des jobs"}
      else
        render json: @job.errors, status:  :unprocessable_entity
      end
    end
    def update
      if @job.update(job_params)
        render json:{jobs: @job,message:"job a ete modifier !!"}
      else 
        render json: @job.errors, status:  :unprocessable_entity
      end
    end
    def destroy
      @job.destroy
      render json: {
       
        message:"job a ete supprimer"
       
      }
    end
    def show

    end


    private
  
    def set_job
      @job = Job.find(params[:id])
    end
    def job_params
      params.require(:job).permit(
        :name
        
      )
    end
end