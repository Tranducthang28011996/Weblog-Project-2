class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :likes
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  scope :created_sort, -> {order created_at: :desc}

  mount_uploader :image, PostUploader
end
