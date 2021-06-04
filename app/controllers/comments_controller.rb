class CommentsController < ApplicationController
  
  def index
    @comments = Comment.all
  end
  
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
  def comment_params
    params.require(:comment).permit(:text)
  end
end
