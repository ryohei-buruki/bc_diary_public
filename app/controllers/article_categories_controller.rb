class ArticleCategoriesController < ApplicationController
  def index
    @article_categories = ArticleCategory.all
  end

  def new
    @article_category = ArticleCategory.new
  end

  def create
    ArticleCategory.create(article_category_params)

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

  def article_category_params
    params.require(:article_category).permit(:name, :description, :image_url)
  end
end
