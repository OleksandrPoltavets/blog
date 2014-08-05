class PagesController < ApplicationController
  before_filter :authorize, only: [:home, :about]

  def home
    @posts = Post.all
    @post = current_user.posts.build
  end

  def about
  end

  def contacts
  end
end
