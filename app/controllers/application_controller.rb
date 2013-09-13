class ApplicationController < ActionController::Base
  protect_from_forgery

protected

  def authorize timestamp, username
    session[:authorized_at] = timestamp
    session[:authorized_username] = username
  end
  
  def deauthorize
    session.delete :authorized_at
    session.delete :authorized_username
  end
  
  def requires_authorization
    if session[:authorized_at]>1.day.ago
      @current_user = session[:authorized_username]
      return true
    else
      redirect_to "/"
      return false
    end
  end

end
