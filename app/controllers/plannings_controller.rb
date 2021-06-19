class PlanningsController < ApplicationController
  before_action :set_planning, only: [:show, :edit, :update, :destroy]
  #authorize_resource
  def new
    @planning = Planning.new

  end


  def index
    #authorize_resource
    # authorize! :manage, :User


    @plannings = Planning.all



  end

  def create
    @planning = Planning.new(user_params)

    respond_to do |format|
      if @planning.save
        format.html { redirect_to plannings_url,success: "Planning was successfully created.", class: "alert alert-success" }
        format.json { render :show, status: :created, location: @planning }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @planning.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    #@planning = Planning.find(params[:id])
  end

  def edit
    # @user = current_user
  end
  def update
    respond_to do |format|
      if @planning.update(user_params)
        format.html{redirect_to @planning, success:'accepte modificate'}
      else
        format.html{ render :edit}
      end
    end
  end
  def destroy
    @planning.destroy
    respond_to do |format|
      format.html { redirect_to plannings_url, danger: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private

  def set_planning
    @planning = Planning.find(params[:id])
  end
  def user_params
    params.require(:planning).permit(
      :date_debut,
      :date_fin,
      :status,
      :jobprofile_id

    )
  end
end
