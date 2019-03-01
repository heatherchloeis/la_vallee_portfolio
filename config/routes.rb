Rails.application.routes.draw do
	root 'application#home'
	get '/about',		 to: "application#about"
	get '/resume',	 to: "application#resume"
	get '/work',		 to: "application#work"
	get '/contact',	 to: "application#contact"
	get '/login', 	 to: "sessions#new"
	post '/login', 	 to: "sessions#create"
	delete 'logout', to: "sessions#destroy"

	resources :users
	resources :password_resets, only: [:new, :create, :edit, :update]
end
