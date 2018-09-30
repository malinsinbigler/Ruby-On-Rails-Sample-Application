Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #route for the root
  root 'posts#index'

  #standard get route
  get 'about' => 'pages#about'

end
