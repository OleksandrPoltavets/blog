class PostsController < ApplicationController
  before_action :correct_user,   only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      flash[:danger] = "Type sype text first!"
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
    redirect_to root_url if @post.nil?
  end
end
