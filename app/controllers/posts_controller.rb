class PostsController < ApplicationController
  before_action :user_signed_in?, only: [:new, :create]

  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: "Post created successfully"
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
