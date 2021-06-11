class CommentsController < ApplicationController
  
  def new
    
    @topic_id = params[:topic_id]
    @comment = Comment.new
  end
  
  def create
     
    @topic_id = params[:topic_id]
    
    @comment = current_user.comments.new(comment_params)
    
    if @comment.save
      redirect_to topics_path, success: 'コメント登録に成功しました'
    else
      flash.now[:danger] = "コメント登録に失敗しました"
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text, :topic_id)
  end
end
