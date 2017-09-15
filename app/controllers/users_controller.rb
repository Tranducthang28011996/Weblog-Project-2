class UsersController < ApplicationController
  before_action :find_user, except: :index
  before_action :authenticate_user!, only: :update

  def index
    @users = User.select(:id, :username, :address, :avatar).order(:username)
      .page(params[:page]).per Settings.page
  end

  def show; end

  def update
    if current_user == @user
      current_user.update_attributes image_params
      flash[:success] = t "show.upload_sucsees"
    else
      flash[:success] = t "show.upload_fails"
    end
    redirect_to @user
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless @user
  end

  def image_params
    params.require(:user).permit :avatar
  end
end
