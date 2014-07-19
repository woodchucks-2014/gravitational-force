module UsersHelper

  def current_user
    @user ||= User.find(session[:user])
  end

  def logged_in?
    current_user
  end

end
