class EmployersController < ApplicationController
  def index
    @employers = Employer.all
  end

  def show
    @employer = Employer.find(params[:id])
    @jobs = @employer.jobs
  end

  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      session[:employer_id] = @employer.id
      redirect_to employer_path(@employer)
    else
      render :new
    end
  end

  def edit
    @employer = current_employer
  end

  def update
    @employer = current_employer.update(employer_params)
    redirect_to employer_path(current_employer)
  end

  private

  def employer_params
    params.require(:employer).permit(:company_name, :street_address, :city, :state, :email, :password)
  end

end
