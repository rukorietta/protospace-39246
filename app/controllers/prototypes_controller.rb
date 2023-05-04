class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all
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
  
  private
  
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end