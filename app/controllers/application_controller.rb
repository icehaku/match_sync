class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user
    if session[:current_user].present?
      session[:current_user]["uid"]
    else
      ""
    end
  end
end
