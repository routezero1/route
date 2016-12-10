class CommentsController < ApplicationController
    before_action :authenticate_user! #user must be logged in to create a comment.
    
    def create 
        @post = Post.find(params[:post_id]) #finding the post
        @comment = Comment.create(params[:comment].permit(:content)) #creating the comment with the comment params
        @comment.user_id = current_user.id #assigning the user id to the current user
        @comment.post_id = @post.id #assigning post id to post.id
        
        if @comment.save
            redirect_to post_path(@post)
        else
            render 'new'
        end
    end
end
