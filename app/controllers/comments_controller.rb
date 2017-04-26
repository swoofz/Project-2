class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    c = @comment.post.id
    if @comment.save
      redirect_to user_path(c)
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
