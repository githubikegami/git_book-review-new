class CommentsController < ApplicationController
  def create
    @comment = Comment.create(rate: comment_params[:rate],text: comment_params[:text],bookreview_id: comment_params[:bookreview_id], user_id: current_user.id)
    redirect_to "/bookreview/#{@comment.bookreview.id}"
  end
  
  def destroy
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.destroy
    end
    redirect_to "/users/#{current_user.id}"
  end

  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
    comment.update(update_params)
    end
    redirect_to "/users/#{current_user.id}"
  end
  
  private
  def comment_params
    params.require(:comment).permit(:rate,:text).merge(bookreview_id: params[:bookreview_id], user_id: current_user.id)
  end
  
  def update_params
    params.require(:comment).permit(:rate,:text)
  end
  
end
