class Article < ActiveRecord::Base
  self.table_name = 'ppq_baikes'
end
class ArticleDetail < ActiveRecord::Base
  self.table_name = 'ppq_baike_details'
end
