class PostsController < ApplicationController
	def index
		@posts = Post.all

		# rails implicitly renders the view with the same name as this method
		# i.e. posts/index
	end

	def new
		@post = Post.new
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
		if(@post.save)
			#present this new post to the user
			redirect_to @post
		else
			# I'm not sure if this is ideal
			# The 'new' view will get rendered with a @post containing validation errors
			# however, the url in the browser is set the create endpoint instead of /new
			# This creates unintended behavior when refreshing that page.
			render 'new'
		end

		
	end

	private def post_params
		params.require(:post).permit(:title, :body)
	end
end
