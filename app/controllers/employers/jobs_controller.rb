class Employers::JobsController < ApplicationController

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
      redirect_to employers_dashboard_path
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
    redirect_to employers_dashboard_path
    else
      render :edit
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :description)
  end
end
