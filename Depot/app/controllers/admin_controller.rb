class AdminController < ApplicationController

  def login
    session[:user_id] = nil
  
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
	redirect_to(:action => "index") #应该直接跳转到user的show页面。。。。
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login" )
  end

  def index
    @total_orders = Order.count
  end
  
end
