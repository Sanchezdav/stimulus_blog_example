class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :content
  belongs_to :user

  validates :title, :content, presence: true

  scope :last_created, -> { order(created_at: :desc)}
end
