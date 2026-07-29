class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, foreign_key: :post_id, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  validates :title, :content, presence: true, length: { minimum: 5, maximum: 255 }
end
