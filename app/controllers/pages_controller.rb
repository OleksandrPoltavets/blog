class PagesController < ApplicationController
  before_filter :authorize, only: [:home, :about]

  def home
  end

  def about
  end

  def contacts
  end
end
