class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @topic = Topic.find(params[:topic_id])
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @topic.comments.create(comment_params)
    redirect_to topics_path
  end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comment.destroy
    redirect_to topics_path
  end
    
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
  
  
end