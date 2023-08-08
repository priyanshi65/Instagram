
class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params.merge(user_id: current_user.id))
    @comment.save
    if request.referrer == root_url
      redirect_to root_path
    else
      redirect_to post_profile_path(@post)
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:user_name, :body)
  end
end























# def set_post
#   @post = Post.find(params[:post_id])
# end

# def destroy
#   @comment.destroy

#   redirect_to post_path(@post), notice: "Comment was successfully destroyed."
# end
# before_action :set_post, only: %i[create destroy]
# before_action :set_comment, only: %i[destroy]

# def set_comment
#   @comment = @post.comments.find(params[:id])
# end
# class CommentsController < ApplicationController
#     def create
#         @post = Post.find(params[:post_id])
#         @comment = @post.comments.create(comment_params)
#         redirect_to post_path(@post)
  #       end
      
  #       private
  #         def comment_params
  #           params.require(:comment).permit(:commenter, :body)
  #         end
  # end
