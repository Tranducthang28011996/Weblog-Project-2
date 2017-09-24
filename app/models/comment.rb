class Comment < ApplicationRecord
  has_many :likes
  has_many :comments, as: :commentable

  belongs_to :post
  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
