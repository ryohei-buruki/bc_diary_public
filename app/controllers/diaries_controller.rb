class DiariesController < ApplicationController
  def index
    
  end

  def new

  end

  def create
    params[:diary][:is_published] = true
    Diary.create(diary_params)
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def diary_params
    params.require(:diary).permit(
      :title, :date, :is_published, :user_id
    )
  end

  def article_params
    params.require(:article).permit(
      :content, :article_category_id, :diary_id
    )
  end
end
