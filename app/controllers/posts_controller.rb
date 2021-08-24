class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def index
    # @posts = Post.where(genre: params[:genre]).page(params[:page]).reverse_order
    @search = Post.ransack(params[:q])
    @posts = @search.result.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    post.destroy
    redirect_to genres_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :user_id, :genre_id)
    end

end
