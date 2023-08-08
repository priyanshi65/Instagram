class FollowsController < ApplicationController
    before_action :set_user

   def create
    if current_user.follow(@user.id)
      if request.referrer == users_url
        redirect_to users_path
      else
        redirect_to user_profile_path(@user.id)
      end
    end
  end

  def destroy
    if current_user.unfollow(@user.id)
      if request.referrer == users_url
        redirect_to users_path
      else
        redirect_to user_profile_path(@user.id)
      end  
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end
end

