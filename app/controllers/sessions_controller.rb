class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:provider].present?
      user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_path
    elsif params[:email].present?
      @employer = Employer.find_by(email: params[:email])
      if @employer && @employer.authenticate(params[:password])
        session[:employer_id] = @employer.id
        redirect_to employers_dashboard_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if current_user
      session[:user_id] = nil
      redirect_to root_path
    else
      session[:employer_id] = nil
      redirect_to root_path
    end
  end

end
