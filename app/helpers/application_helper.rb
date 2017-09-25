module ApplicationHelper
  def user_list
    User.order(:username).map &:username
  end

  def current_user? user
    user == current_user
  end
end
