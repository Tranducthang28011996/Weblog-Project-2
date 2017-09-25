class PostsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :retrieve_post, only: %i[show edit update]

  include TagHelper

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new params_posts

    if @post.save
      include_tag @post, params[:tags] if params[:tags].present?
      flash[:success] = t "posts.create.create_sucsees"
      redirect_to root_path
    else
      flash[:success] = t "posts.create.create_fail"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update_attributes params_posts
      update_tag @post, params[:tag_ids], params[:tags]
      flash[:success] = t "posts.update.update_sucsees"
      redirect_to root_path
    else
      flash[:success] = t "posts.update.update_fail"
      render :edit
    end
  end

  def destroy
    @post = Post.find_by id: params[:post_id]
    redirect_to root_path unless @post.destroy
  end

  private

  def params_posts
    params.require(:post).permit :title, :content, :image
  end

  def retrieve_post
    @post = Post.find_by id: params[:id]
    redirect_to root_path unless @post
  end
end
