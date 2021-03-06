class PostsController < ApplicationController

	# Restrict access to all pages except home and show.
	# Unauthenticated users will not be able to create/edit/delete
	# This is just a basic example and full authtication should be implemented for any real application
	http_basic_authenticate_with name: "Mike", password:"1234", except: [:index, :show]

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

	def edit
		# Get the post via input param
		@post = Post.find(params[:id])
	end

	def update
		# Get the post via input param
		@post = Post.find(params[:id])

		#save this post to the db
		if(@post.update(post_params))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	#wrapper for which request params are valid and expected
	private def post_params
		params.require(:post).permit(:title, :body)
	end
end
