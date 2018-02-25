class EmployersController < ApplicationController
  def index
  end

  def show
    @employer = current_employer
    @jobs = @employer.jobs
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

  def edit
    @employer = current_employer
  end

  def update
    @employer = current_employer.update(employer_params)
    redirect_to employers_dashboard_path
  end

  private

  def employer_params
    params.require(:employer).permit(:company_name, :street_address, :city, :state, :email, :password)
  end

end
