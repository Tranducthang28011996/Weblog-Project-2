class User < ApplicationRecord
  attr_accessor :login

  has_many :comments
  has_many :tags
  has_many :likes
  has_many :posts

  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:user, :admin]

  validates :email, presence: true,
    length: {maximum: Settings.email_validate}

  def self.find_first_by_auth_conditions warden_conditions
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions)
        .where(["lower(username) = :value OR lower(email) = :value",
        {value: login.downcase}]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

end
