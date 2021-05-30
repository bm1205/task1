class CommentsController < ApplicationController
  
  def index
    @comment_topics = current_user.comment_topics
  end
  
  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:topic_id]
    
    if comment.save
      redirect_to comment_path, success: 'コメント登録に成功しました'
    else
      redirect_to comment_path, danger: 'コメント登録に失敗しました'
    end
  end
    
end
