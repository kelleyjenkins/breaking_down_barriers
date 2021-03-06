class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    # jobs = Job.all

    if @user.profile != nil
      jobs_near = Job.near([@user.profile.latitude, @user.profile.longitude], 20)

      @job_markers = [['Me', @user.name, @user.profile.latitude, @user.profile.longitude]]
        jobs_near.each do |job|
          @job_markers << [job.title, job.employer.company_name, job.latitude, job.longitude ]
      end
    end

  end
end
