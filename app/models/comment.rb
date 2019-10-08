class Comment < ApplicationRecord
  has_rich_text :content
  
  belongs_to :post
  belongs_to :user
end
