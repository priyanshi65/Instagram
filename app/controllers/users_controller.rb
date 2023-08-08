class UsersController < ApplicationController

    def index
        @users=User.where.not(id: current_user.id)
    end
   
    def show
        # @user----------instance object----------specific
        @user = User.find(params[:id])
        @posts = @user.posts.order(created_at: :desc)
        @followers = current_user.followers
        @followings = current_user.followings    
    end

    def edit 
        @user = User.find(params[:id])
        @posts = current_user.posts
    end

    def profile
        @user = User.find(params[:id])
        @posts = current_user.posts
        @followers = @user.followers
        @followings = @user.followings
        
        if current_user.id == @user.id
          redirect_to user_path(current_user)
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params) # strong params
          redirect_to user_path(@user), notice: 'Profile updated successfully.'
        else
          render :edit
        end
    end

    private
  
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :image)
    end

end

   
    




    # def follow
    #   @user = User.find(params[:id])
    #   @post_ids = @user.post_ids
    #   current_user.followees << @user
    #   redirect_back(fallback_location: user_path(@user))
    # end
    
    # def unfollow
    #   @user = User.find(params[:id])
    #   current_user.followed_users.find_by(followee_id: @user.id).destroy
    #   redirect_back(fallback_location: user_path(@user))
    # end
    

