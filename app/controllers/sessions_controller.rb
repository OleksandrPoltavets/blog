class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:email]
      user = User.find_by_email(params[:email])

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_url, notice: 'Logged In.'
      else
        flash.now.alert = 'Email of Password is Invalid!'
        render 'new'
      end
    else
      user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged In.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
