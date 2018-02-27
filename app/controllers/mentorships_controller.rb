class MentorshipsController < ApplicationController

  def create
    @mentorship = current_user.mentorships.build(:mentor_id => params[:mentor_id])
    if @mentorship.save
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @mentorship = current_user.mentorships.find(params[:id])
    @mentorship.destroy
    redirect_to current_user
  end
end
