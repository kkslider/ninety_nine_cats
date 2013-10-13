module SessionsHelper
  def current_user
    User.find_by_session_token(session[:session_token])
  end
end