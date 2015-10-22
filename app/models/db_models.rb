class Article < ActiveRecord::Base
  has_one :article_detail
end
class ArticleDetail < ActiveRecord::Base
  belongs_to :article
end
