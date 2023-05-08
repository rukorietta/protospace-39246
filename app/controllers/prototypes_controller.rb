class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'プロトタイプの投稿が完了しました'
    else
      # バリデーションエラーが発生した場合に、再度@prototypeオブジェクトを設定する
      @prototype.attributes = prototype_params
      render :new
    end
  end

   def edit
    @prototype = Prototype.find(params[:id])
    unless @prototype.user == current_user
      redirect_to root_path, alert: '投稿者以外は編集できません'
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: 'プロトタイプの更新が完了しました'
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path,notice:'プロトタイプを削除しました'
  end

  # ログインしていなくてもアクセスできるようにする
  skip_before_action :authenticate_user!, only: [:index, :show]
  
  private
  
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end