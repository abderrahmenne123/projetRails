
class DemandesController < ApplicationController
  before_action  :set_jobprofiles ,only: [:show, :edit, :update, :destroy,:create , :new]
  #authorize_resource
  def new
    @demande = Demande.new

  end


  def index
    #authorize_resource
    # authorize! :manage, :User

    if current_user.role == 'client'
      @demandes = Demande.page(params[:page]).where(sender_id: current_user.id , :status => 'encours').recherche_demande(params[:recherche_demande]).order('created_at DESC')

    else
      if current_user.role == 'technicien'
        @demandes = Demande.page(params[:page]).where( :recipient_id  => current_user.id , :status => 'encours').recherche_demande(params[:recherche_demande]).order('created_at DESC')

      end
      if current_user.role == 'supadmin'
        @demandes = Demande.page(params[:page]).where(:status => 'encours').recherche_demande(params[:recherche_demande]).order('created_at DESC')
      end
    end


  end
  def listeaccepter
    #authorize_resource
    # authorize! :manage, :User
    if current_user.role == 'client'
      @demandes = Demande.page(params[:page]).where(sender_id: current_user.id ,:status => 'accepter').recherche_demande(params[:recherche_demande]).order('created_at DESC')

    else
      if current_user.role == 'technicien'
        @demandes = Demande.page(params[:page]).where( :recipient_id  => current_user.id,:status => 'accepter').recherche_demande(params[:recherche_demande]).order('created_at DESC')

      end
      if current_user.role == 'supadmin'
        @demandes = Demande.page(params[:page]).where(:status => 'accepter').recherche_demande(params[:recherche_demande]).order('created_at DESC')
      end
    end


  end
  def listerefuser
    #authorize_resource
    # authorize! :manage, :User


    if current_user.role == 'client'
      @demandes = Demande.page(params[:page]).where(sender_id: current_user.id ,:status => "refuser").recherche_demande(params[:recherche_demande]).order('created_at DESC')

    else
      if current_user.role == 'technicien'
        @demandes = Demande.page(params[:page]).where( :recipient_id  => current_user.id ,:status => "refuser").recherche_demande(params[:recherche_demande]).order('created_at DESC')

      end
      if current_user.role == 'supadmin'
        @demandes = Demande.page(params[:page]).where(status: "refuser").recherche_demande(params[:recherche_demande]).order('created_at DESC')
      end
    end




  end




  def accepter
    #@demande  =  Demande.find(params[:id])
    @demande  = set_job
    @demande.update_attributes(:status => "accepter")
    NotificationMailer.sendnotification_email(@demande.sender,@demande.recipient,"accepter").deliver
    redirect_to demandes_path
  end
  def refuser
    @demande  = set_job

    @demande.update_attributes(:status => "refuser")
    NotificationMailer.sendnotification_email(@demande.sender,@demande.recipient,"refuser").deliver
    redirect_to demandes_path
  end

  def create
    @demande = Demande.new(user_params)

    @demande.jobprofile_id = @jobprofile.id

    respond_to do |format|
      if @demande.save
        SendDemandeNotificationJob.perform_later(@demande)
        NotificationMailer.sendnotification_email(@demande.recipient,@demande.sender,"demande creér").deliver
        format.html { redirect_to demandes_url, notice: "demande was successfully created." }
        format.json { render :show, status: :created, location: @demande }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @demande.errors, status: :unprocessable_entity }
      end
    end
  end
  def show


  end

  def edit
    # @user = current_user
  end
  def update
    respond_to do |format|
      if @demande.update(user_params)
        format.html{redirect_to @demande, notice:'accepte modificate'}
      else
        format.html{ render :edit}
      end
    end
  end
  def destroy
    @demande.destroy
    respond_to do |format|
      format.html { redirect_to demandes_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def profileparuser

    @demandes = Demande.where(:user_id => User.id)
    format.html{ render :@demandes}
  end

  private

  def set_job
    @demande = Demande.find(params[:id])
  end
  def set_jobprofiles
    @jobprofile = Jobprofile.find(params[:jobprofile_id])
  end
  def user_params
    params.require(:demande).permit(
      :body,
      :status,
      :sender_id,
      :recipient_id,
      :jobprofile_id,
      :date_debut,
      :date_fin,
      :commentaire,
      photo:[]


    )
  end
  def demande_params
    params.require(:demande).permit(

      :status



    )
  end

end