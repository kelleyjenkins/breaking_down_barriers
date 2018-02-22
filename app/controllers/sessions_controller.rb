class SessionsController < ApplicationController

  def create
    if params[:provider].present?
      user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_path
    elsif params[:company_email].present?
      @employer = Employer.find_by(company_email: params[:company_email])
      if @employer && @employer.authenticate(params[:password])
        session[:employer_id] = @employer.id
        redirect_to employer_dashboard_path
      else
        redirect_to_root_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
