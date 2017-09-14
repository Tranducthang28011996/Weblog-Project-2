class RelationshipsController < ApplicationController
  before_action :check_exists_user?

  def create
    if @user != current_user && request.xhr?
      current_user.follow @user
      render json: {
        form_follow: render_to_string(partial: "users/follow_form", locals: {user: @user})
      }
    end
  end


  def destroy
    if @user != current_user && request.xhr?
      current_user.unfollow @user
      render json: {
        form_follow: render_to_string(partial: "users/follow_form", locals: {user: @user})
      }
    end
  end

  private

  def check_exists_user?
    @user = User.find_by id: params[:id]
    redirect_to root_url unless @user
  end
end
