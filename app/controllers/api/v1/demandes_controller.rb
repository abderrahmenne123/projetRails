class API::V1::DemandesController < ApplicationController
    before_action :set_demande,  only: [:show, :edit, :update, :destroy]

    def index
        @demande = Demande.all
      # render json: @jobs, status: :ok
      render json: {
        status: :ok,
        message:"liste des jobs",
        demandes: @demande
      }
    end
    def create
        @demande = Demande.new(demande_params)
        if @demande.save 
          render json:{jobs: @demande, status: :created,message:"demande a ete creer "}
        else
          render json: @demande.errors, status:  :unprocessable_entity
        end
    end

    def accepter  
        #@demande  =  Demande.find(params[:id])
        @demande  = set_demande 
        @demande.update_attributes(:status => "accepter")
        render json: {
            status: :ok,
            message:"demande a ete accepeter",
            demandes: @demande
          }
    end
      def refuser  
        @demande  = set_demande  
        @demande.update_attributes(:status => "refuser")
        render json: {
            status: :ok,
            message:"demande a ete refuser",
            demandes: @demande
          }
      end
    def update

    end
    def destroy

    end
    def show
        render json:@demande
    end

    def set_demande
        @demande = Demande.find(params[:id])
    end
      
      def demande_params
        params.require(:demande).permit(
          :body,
          :status,
          :sender_id,
          :recipient_id
          
          
        )
      end
end