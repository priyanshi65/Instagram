class LikesController < ApplicationController
   before_action :find_post
   before_action :find_like, only: [:destroy]

    def index
      @likes = Like.where(post_id: params[:post_id])
    end
    
    def create
      if request.referrer == root_url
        redirect_to root_path
      else
        redirect_to user_profile_path(current_user.id)
      end
      # if already_liked?
      #   flash[:notice] = "You can't like more than once"
      # else
      #   @post.likes.create(user_id: current_user.id)
      # end
      # render json: {"success": true, "message": 'Like created successfully' }
    end


    def destroy
      if request.referrer == root_url
          redirect_to root_path
        else
          redirect_to user_profile_path(current_user.id)
        end
      # if !(already_liked?)
      #   flash[:notice] = "Cannot unlike"
      # else
      #   @like.destroy
      # end
      # render json: {"success": true, "message": 'Like destroyed successfully' }
    end

    private
    
    def find_like
        @like = @post.likes.find(params[:id])
      end
      
    def find_post
      @post = Post.find(params[:post_id])
    end
    
    def already_liked?
      Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    end

  end







  


  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  # if request.referrer == root_url
  #   redirect_to root_path
  # else
  #   redirect_to user_profile_path(current_user.id)
  # end
  # def find_post
#  @post = Post.find(params[:post_id])
#  rescue ActiveRecord::RecordNotFound
#  redirect_to root_path, notice: "Post not found"  
# end