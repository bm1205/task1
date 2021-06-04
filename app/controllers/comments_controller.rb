class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    
    if @comment.save
      redirect_to topics_path, success: 'コメント登録に成功しました'
    else
      flash.now[:danger] = "コメント登録に失敗しました"
      render :new
    end
  end
  private
  def topic_params
    params.require(:comment).permit(:commenttext)
  end
end
