class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_employer

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_employer
    @current_employer ||= Employer.find(session[:employer_id]) if session[:employer_id]
  end
end
