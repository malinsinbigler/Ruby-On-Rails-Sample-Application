Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #route for the root
  root 'posts#index', as: 'home'

  #standard get route
  get 'about' => 'pages#about', as: 'about'

  #resource route
  #you can view all endpoints by doing 'rake routes'
  resources :posts do
  	# nested resource
  	# URL will look like /post/1/comments/
  	resources :comments
  end

end
