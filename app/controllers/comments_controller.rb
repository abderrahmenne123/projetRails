class CommentsController < ApplicationController
  def create
    @jobprofile = Jobprofile.find(params[:jobprofile_id])
    @comment = @jobprofile.comments.create(params[:comment].permit(:user_id, :comment,:rating))

    redirect_to jobprofile_path(@jobprofile)
  end

  def destroy
    @jobprofile = Jobprofile.find(params[:jobprofile_id])
    @comment = @jobprofile.comments.find(params[:id])
    @comment.destroy
    redirect_to jobprofile_path(@jobprofile)
  end
end
