Rails.application.routes.draw do
	root 'sessions#index'
	
	resources :users
	resources :events
	resources :memberships

	post "/login" => "sessions#login"
	delete "/logout" => "sessions#logout"
	post "/comments" => "comments#create"
	patch "/users/:id" => "users#update"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
