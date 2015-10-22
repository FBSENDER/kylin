require 'db_models'
class ArticleCategoriesController < ApplicationController
  def index
    @categories = ArticleCategory.all.to_a
  end
  def new
    @category = ArticleCategory.new
  end
  def create
    @category = ArticleCategory.new(category_params_all)
    redirect_to @category
  end
  def update
    @category = ArticleCategory.find(params[:id])
    @category.update_attributes(category_params)
    redirect_to @category
  end
  def show
    @category = ArticleCategory.find(params[:id])
    Article.table_name = @category.article_table_name
    ArticleDetail.table_name = @category.article_detail_table_name
    redirect_to "/"
  end
  def edit
    @category = ArticleCategory.find(params[:id])
  end
  def destroy
  end
  private 
  def category_params
    params.require(:article_category).permit(:category_name)
  end
  def category_params_all
    params.require(:article_category).permit(:category_name,:article_table_name,:article_detail_table_name)
  end
end
