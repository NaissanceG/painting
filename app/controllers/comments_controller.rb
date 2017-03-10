class CommentsController < ApplicationController
  before_action :set_painting

  def create
    @comment = @painting.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path}
        format.js
      end
    else
      flash[:alert] = "Oops, try again."
      render root_path
    end
  end

  def destroy
    @comment = @painting.comments.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
        respond_to do |format|
          format.html {redirect_to root_path}
          format.js
        end
      end
    end

private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_painting
    @painting = Painting.find(params[:painting_id])
  end

end
