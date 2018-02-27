class JobsController < ApplicationController
  def index
    # employer = Employer.find(params[:employer_id])
    # @jobs = employer.jobs
    @jobs =Job.all
  end

  def show
    employer = Employer.find(params[:employer_id])
    @job = employer.jobs.find(params[:id])
  end

  def new
    employer = Employer.find(params[:employer_id])
    @job = employer.jobs.new
  end

  def create
    employer = Employer.find(params[:employer_id])

    @job = employer.jobs.create(job_params)
    if @job.save
      redirect_to employer_path(current_employer)
    else
      render :new
    end
  end

  def edit
    employer = Employer.find(params[:employer_id])
    @job = employer.jobs.find(params[:id])
  end

  def update
    employer = Employer.find(params[:employer_id])
    @job = employer.jobs.find(params[:id])
    @job.update(job_params)
    if @job.save
      redirect_to employer_path(current_employer)
    else
      render :edit
    end
  end

  def destroy
    employer = Employer.find(params[:employer_id])
    @job = employer.jobs.find(params[:id])
    @job.destroy

    redirect_to employer_path(employer)
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :full_address)
  end
end
