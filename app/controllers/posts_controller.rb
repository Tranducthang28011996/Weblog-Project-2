class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  include TagHelper

  def new
    @post = current_user.posts.new
  end


  def create
    @post = current_user.posts.new params_posts

    if @post.save
      include_tag @post, params[:tags] if params[:tags].present?
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def upadte; end

  def destroy; end

  private

  def params_posts
    params.require(:post).permit :title, :content, :image
  end
end
