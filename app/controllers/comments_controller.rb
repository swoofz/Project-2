class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.body = params[:comment][:body]
    @comment.user_id = current_user.id
    @comment.save
    if @comment.save
      redirect_to :back
    else
      redirect_to new_comment_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  private
  def comment_params
    params.required(:comment).permit(:id, :body, :user_id, :post_id)
  end
end
