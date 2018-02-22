class EmployersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      session[:employer_id] = @employer.id
      redirect_to employers_dashboard_path
    else
      render :new
    end
  end
end
