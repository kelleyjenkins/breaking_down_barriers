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
      # else
      #   redirect_to root_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
