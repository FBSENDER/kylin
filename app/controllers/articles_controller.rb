require 'db_models'
class ArticlesController < ApplicationController
  def index
    @tasks = Article.where(status: 0).to_a
  end
  def edit
    article_id = params[:id]
    @article = Article.where(id: article_id.to_i).take
    @contents = JSON.parse(@article.article_detail.contents_json)
  end
  def update
    @article = Article.find(params[:id])
    @article.article_detail.update_attributes(article_detail_params)
    redirect_to "/"
  end
  def token
    put_policy = Qiniu::Auth::PutPolicy.new(
      "ddzhusu"
    )
    result = {"uptoken" => Qiniu::Auth.generate_uptoken(put_policy)}
    render json: result.to_json
  end
  private
  def article_detail_params
    params.require(:article_detail).permit(:contents_json)
  end
end
