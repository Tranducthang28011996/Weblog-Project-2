class User < ApplicationRecord
  attr_accessor :login

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  devise :omniauthable, omniauth_providers: [:facebook]

  enum role: [:user, :admin]

  validates :email, presence: true,
    length: {maximum: Settings.email_validate}

  mount_uploader :avatar, ImageUploader

  scope :search_user, lambda {|username| where("username LIKE '%#{username}%'") if username.present?}

  scope :hot_author, -> {joins(:posts)
    .select("users.id, username", "email", "avatar","count(posts.id) AS post_count")
    .group("users.id").order("post_count DESC").limit 4}

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
    devise_mailer.send(notification, self, *args).deliver_later wait: Settings.wait_time.seconds
  end

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end

  class << self
    def new_with_session params, session
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end

    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email || "facebook@gmail.com"
        user.password = Devise.friendly_token[Settings.devise_friendly_token_min,
          Settings.devise_friendly_token_max]
        user.username = auth.info.name
        user.avatar = auth.info.image
        user.confirmed_at = Time.zone.now
      end
    end
  end
end
