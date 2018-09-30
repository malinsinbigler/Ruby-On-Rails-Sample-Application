class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new

	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		# view input parameters via page output
		# render plain: params[:post].inspect



		#accept only valid post params
		@post = Post.new(post_params)

		#save this post to the db
		@post.save

		#present this new post to the user
		redirect_to @post
	end

	private def post_params
		params.require(:post).permit(:title, :body)
	end
end
