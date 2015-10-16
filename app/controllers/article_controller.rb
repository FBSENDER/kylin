require 'db_models'
class ArticleController < ApplicationController
  def tasks
    @tasks = Article.where(status: 0).to_a
  end
  def edit
    article_id = params[:id]
    @article = Article.where(id: article_id.to_i).take
    @article_detail = ArticleDetail.where(baike_id: @article.id).select(:id, :contents_json).take
  end
  def finish
    article_id = params[:article_id].to_i
    article_json = params[:article_json]
    article_detail = ArticleDetail.where(baike_id: article_id).take
    article_detail.contents_json = article_json
    article_detail.save
    redirect_to "/article/edit/1"
  end
  def token
    put_policy = Qiniu::Auth::PutPolicy.new(
      "ddzhusu"
    )
    result = {"uptoken" => Qiniu::Auth.generate_uptoken(put_policy)}
    render json: result.to_json
  end

  def upload
  end
end
