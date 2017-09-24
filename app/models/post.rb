class Post < ApplicationRecord

  belongs_to :user

  has_many :comments, as: :commentable
  has_many :likes
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: true,
    length: {maximum: Settings.post.title.maxlength}
  validates :content, presence: true,
    length: {maximum: Settings.post.content.maxlength}

  scope :created_sort, -> {order created_at: :desc}

  mount_uploader :image, PostUploader
end
