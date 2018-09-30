class PagesController < ApplicationController
	def about
		# Send data to the view
		@title = 'About Us'
		@content = 'This is the about page.'
	end
end
