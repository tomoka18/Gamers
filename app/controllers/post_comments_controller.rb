class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = @post.id
    comment.save
    # 通知レコードを作成
    comment.post.create_notification_comment(current_user, comment.id)
  end

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    @post = Post.find(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
