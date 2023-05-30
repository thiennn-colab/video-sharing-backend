class Dislike < ApplicationRecord
  self.table_name_prefix = "post_"
  belongs_to :post, counter_cache: true
  belongs_to :user
end
