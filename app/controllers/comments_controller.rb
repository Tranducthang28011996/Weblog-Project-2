class CommentsController < ApplicationController
  before_action :find_id_comment
  before_action :authenticate_user!

  def create
    if @parent && current_user
      @comment = @parent.comments.build message_params
      @comment.user_id = current_user.id
      @comment.save
      render json: {
        post_id: @parent.id,
        comment_id: @comment.post.id,
        html: render_to_string(partial: "comments/single_comment", locals: {comment: @comment})
      }
    end
  end

  def update
    render json: {status: 1} if @parent.update_attributes content: params[:comment]
  end

  def destroy
    render json: {status: 1} if @parent.destroy
  end

  private

  def message_params
    params.require(:comment).permit :content
  end

  def find_id_comment
    @parent = Post.find_by_id params[:post_id] if params[:post_id]
    @parent = Comment.find_by_id params[:comment_id] if params[:comment_id]

    redirect_to root_path unless defined? @parent
  end
end
