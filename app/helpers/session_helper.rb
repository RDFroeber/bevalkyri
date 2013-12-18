module SessionHelper
  def logged_in?
    session[:user_id].present?
  end

  def authenticated!
    unless logged_in?
      redirect_to new_session_path
    end
  end

  #TODO if user.find by sessions id returns null delete the cookie and return new user show page
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_player
    @current_player ||= Player.find_by(user_id: session[:user_id])
  end  
end