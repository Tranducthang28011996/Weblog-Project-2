class UsersController < ApplicationController
  before_action :check_exists_user?, except: :index

  def index
    @users = User.select(:id, :username, :address).order :username
  end

  def show; end

  private

  def check_exists_user?
    @user = User.find_by id: params[:id]
    redirect_to root_url unless @user
  end
end
