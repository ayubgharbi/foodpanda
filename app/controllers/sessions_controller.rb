class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_url
  	else 
  		redirect_to login_url, alert: "Invalid user/password combination"
  	end
  end

  def destroy
    log_out  if logged_in?
  	redirect_to root_url
  end

  def fb_create 
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id 
    log_in user 
    redirect_to root_url
  end

  def fb_destroy 
    session[:user_id] = nil
    log_out 
    redirect_to root_url
  end 

  def failure 
    render :text => "Sorry, but you didn't allow access to our app!"
  end 
end
