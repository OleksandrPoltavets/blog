class PostsController < ApplicationController
  before_action :correct_user, only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      flash[:danger] = "Type some text first!"
      redirect_to root_url
    end
  end

  def destroy
    @post.destroy
    redirect_to root_url
  end
  
  private

    def post_params
      params.require(:post).permit(:content)
    end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    if @post.nil?
      redirect_to root_url
      flash[:error] = "You cannot delete this post!"
    end
  end
end
