class CommentsController < ApplicationController
	def create
		#obtain this post
		@post = Post.find(params[:post_id])

		#create and additional comment for this post
		@comment = @post.comments.create(comment_params)

		#redirect back to the show page for this post
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id]) 
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	#valid input params for comments
	private def comment_params
		params.require(:comment).permit(:username, :body)
	end
end
