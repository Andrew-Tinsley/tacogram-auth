class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    if @current_user == nil
      redirect_to "/login"
    end
  end

  def create
    if @current_user == nil
      redirect_to "/login"
      return
    end
    @post = Post.new
    @post["body"] = params["body"]
    @post["image"] = params["image"]
    @post.user = @current_user
    @post.save
    redirect_to "/posts"
  end
end
