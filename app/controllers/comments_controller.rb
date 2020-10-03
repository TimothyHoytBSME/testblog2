class CommentsController < ApplicationController
  
  #http_basic_authenticate_with name: "admin", password: "password", only: [:destroy]
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    
    redirect_to post_path(@post)
    
    #if(@comment.save)
    #  redirect_to post_path(@post)
    #else
    #  render 'posts/show'
    #end
    
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:title, :body)
    end
end
