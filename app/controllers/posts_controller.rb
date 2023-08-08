class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc)
  end
    
  def new
    @post = Post.new
  end
  
  def create
    @user = User.find(current_user.id)
    @post = @user.posts.create(post_params)
    @post.user_name = current_user.username
    if @post.save
      redirect_to root_path, notice: "Post created successfully."
    else
      render :new
    end
  end
        
  def show
    @post = Post.find(params[:id])
    @like = @post.likes.find_by(user_id: current_user.id) if current_user
    @comments = @post.comments
  end
  
  def profile
    @post = Post.find(params[:id])
    # @posts = current_user.post
    @user = @post.user_id
    @user_s = User.find(@user)
    @followers = @user_s.followers
    @followings = @user_s.followings
    
    if current_user.id == @user_s.id
      redirect_to user_path(current_user)
    end
  end
  
  def edit
    @post = Post.find(params[:id]) 
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to root_path
  end
  
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
  end

  private
  def post_params
    params.require(:post).permit(:image,:user_id,:user_name,:bio)
  end
  
end









# def sidebar
#   @posts = current_user.posts
# end
# def profile
    # @user = User.find(params[:id])
    # @posts = @user.posts
    # @followers = @user.followers
    # @followings = @user.followings
# end

# def update
#   if current_user.update(post_params)
  #     redirect_to root_path, notice: "Image uploaded successfully."
  #   else
  #     redirect_to root_path, alert: "Failed to upload image."
  #   end
  # end

  # def set_post
  #   @post = Post.find_by_username(params[:user_name])
  # end
    

#   def new
#     @post = Post.new
#     respond_to do |format|
#       format.html
#       format.js
#     end
#   end


#   def create
#     @post = Post.create(post_params)
#     redirect_to posts_path
#   end
#   def add_like
#   def add_like
#     @post = Post.find(params[:post_id])
#     if @post
#       @post.likes[0].like_count +=1

#       if @post.likes[0].save
#         respond_to do |format|
#           format.json { render :show, status: :ok }
#         end
#       end
#     end
#   end
    #     @post = Post.find(params[:post_id])
    #     if @post
    #       @post.likes[0].like_count +=1
    
    #       if @post.likes[0].save
    #         respond_to do |format|
    #           format.json { render :show, status: :ok }
    #         end
    #       end
    #     end
    #   end
    
    # def like
    #   @post = Post.find(params[:id])
    #   current_user.likes.create(post: @post)
    #   redirect_to posts_path
    # end
    
    # def comment
    #   @post = Post.find(params[:id])
    #   @comment = current_user.comments.build(comment_params)
    #   @comment.post = @post
    #   if @comment.save
    #     redirect_to posts_path
    #   else
    #     # Handle validation errors
    #   end
    # end
