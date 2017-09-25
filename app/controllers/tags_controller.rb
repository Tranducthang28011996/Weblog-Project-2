class TagsController < ApplicationController
  before_action :find_tag

  def show
    @posts = @tag.posts.created_sort
      .page(params[:page]).per Settings.page
  end

  private

  def find_tag
    @tag = Tag.find_by id: params[:id]
    redirect_to root_url unless @tag
  end
end
