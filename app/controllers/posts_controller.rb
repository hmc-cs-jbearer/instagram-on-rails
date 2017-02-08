class PostsController < ApplicationController
  def new
    @post = Post.new()
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save()
      flash[:success] = "Post created!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.update()
      flash[:success] = "Post updated!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    Post.destroy(params[:id])
    flash[:success] = "Post deleted."
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:image, :description)
    end
end
