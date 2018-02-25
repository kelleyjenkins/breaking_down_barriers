class ProfilesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @profile = Profile.new
  end

  def create
    user = User.find(params[:user_id])
    profile = user.build_profile(profile_params)
    if profile.save
      redirect_to "/users/#{user.id}"
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:street_address, :city, :state, :zip, :summary, :skills)
  end

end
