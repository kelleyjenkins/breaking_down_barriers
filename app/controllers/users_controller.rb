class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    jobs = Job.all
    if @user.profile != nil
    @job_markers = [['Me', @user.profile.latitude, @user.profile.longitude]]
      jobs.each do |job|
        @job_markers << [job.title, job.latitude, job.longitude ]
      end
    end
  end
end
