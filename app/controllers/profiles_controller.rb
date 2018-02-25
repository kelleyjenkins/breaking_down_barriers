class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    user = current_user
    profile = user.build_profile(profile_params)
    if profile.save
      redirect_to "/users/#{user.id}"
    else
      render :new
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    user = current_user
    @profile = user.profile
    @profile.update(profile_params)
    if @profile.save
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:street_address, :city, :state, :zip, :summary, :skills)
  end

end
