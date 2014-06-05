class PostsController < ApplicationController
  def index
  	@posts Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

 def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      redirect_to root_url
  end

  end
end
