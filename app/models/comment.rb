class Comment < ApplicationRecord
  has_many :likes
  has_many :comments, as: :commentable, dependent: :destroy

  belongs_to :post
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :content, presence: true,
    length: {maximum: Settings.comment.content.maxlength}

  def post
    commentable.is_a?(Post) ? commentable : commentable.post
  end
end
