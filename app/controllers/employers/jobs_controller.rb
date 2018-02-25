class Employers::JobsController < ApplicationController
  def index
    employer = Employer.find(params[:id]).jobs
    @jobs = employer.jobs
  end


  def show
    @job = current_employer.jobs.find_by(id: params[:id])
  end

  def new
    @employer = current_employer
    @job = current_employer.jobs.new
  end

  def create
    @job = current_employer.jobs.new(job_params)
    if @job.save
      redirect_to employer_path(current_employer)
    else
      render :new
    end
  end

  def edit
    @job = Job.find_by(id: params[:id])
  end

  def update
    @job = Job.find_by(id: params[:id])
    @job.update(job_params)
    if @job.save
      redirect_to employer_path(current_employer)
    else
      render :edit
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :description)
  end
end
