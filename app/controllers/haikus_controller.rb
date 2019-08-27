class HaikusController < ApplicationController
  # before_action :authenticate_user!
  before_action :find_haiku, only: [:show, :edit, :update, :destroy]
  before_action :validate_user, only: [:edit, :update, :destroy]

  def index
    @haikus = Haiku.order(created_at: :desc)
  end

  def show
    
  end

  def new
    @haiku = Haiku.new
  end

  def edit
  end

  def create
    @haiku = Haiku.new(haiku_params)
    @haiku.user_id = current_user.id
    if @haiku.save
      redirect_to @haiku, notice: '作成できました'
    else
      render :new, alert: '作成出来ませんでした'
    end
  end

  def update
    if @haiku.update(haiku_params)
      redirect_to @haiku, notice: '更新できました'
    else
      render :edit, alert: '更新出来ませんでした'
    end
  end

  def destroy
    if @haiku.destroy
      redirect_to root_path, notice: '削除に成功しました'
    else
      redirect_to root_path, alert: '削除出来ませんでした'
    end
  end

  private
  def find_haiku
    @haiku = Haiku.find(params[:id])
  end

  def haiku_params
    params.require(:haiku).permit(:title, :body)
  end

  def validate_user
    if @haiku.user != current_user
      redirect_to root_path, alert: "自分の投稿ではありません"
    end
  end

end
