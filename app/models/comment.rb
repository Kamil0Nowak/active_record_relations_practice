class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes, as: :likeable, dependent: :destroy

  validates :content, presence: true
end
