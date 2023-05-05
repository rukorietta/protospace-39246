class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.new(comment_params.merge(user_id: current_user.id, prototype_id: params[:prototype_id]))
    if @comment.save
      redirect_to prototype_path(params[:prototype_id]), notice: 'コメントを投稿しました'
    else
      flash.now[:alert] = 'コメントの投稿に失敗しました'
      render 'prototypes/show'
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end