module ApplicationHelper
  def user_list
    User.order(:username).map(&:username)
  end
end
