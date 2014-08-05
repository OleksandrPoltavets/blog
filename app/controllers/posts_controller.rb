class PostsController < ApplicationController

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

  end
  
  private

    def post_params
      params.require(:post).permit(:content)
    end

end
