# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  layout "store"
  before_filter :authorize, :except => :login 
	
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  #def permission_required user, perm
   	#raise (user.has_permission? perm).inspect
	#unless user.has_permission? perm
     #flash[:error] = "You do not have permissions in this area."
     #redirect_back_or_default
     #redirect_to :
    #end
  #end

 # def permission_required user, perm
  # unless user.has_permission? perm
   #  flash[:error] = "You do not have permissions in this area."
     #redirect_back_or_default
    #end
  #end

  #def role_required user, role
   # unless user.plays? role
    #flash[:error] = "You can't do that!" 
  #end



  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
 protected
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Please log in"
      redirect_to :controller => :admin, :action => :login
    end
  end


end
