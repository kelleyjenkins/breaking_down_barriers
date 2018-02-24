class Employers::JobsController < ApplicationController
  def index
  end

  def new
    employer = current_employer
    @jobs = employer.jobs.build
  end

  def create
    employer = current_employer
    @job = employer.jobs.build(job_params)
    if @job.save
      redirect_to employers_dashboard_path
    else
      render :new
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :description)
  end
end
