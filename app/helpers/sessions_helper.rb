module SessionsHelper
  #Logs in the given user
  def logged_in(user)
    sessions[:user_id] = user.id
  end

  # Returns the current logged in user, if any
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: [:user_id])
    end
  end
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
