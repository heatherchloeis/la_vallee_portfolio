Rails.application.routes.draw do
	root 'application#home'
	get '/about',		 to: "application#about"
	get '/resume',	 to: "application#resume"
	get '/work',		 to: "application#work"
	get '/contact',	 to: "application#contact"
	get '/login', 	 to: "sessions#new"
	post '/login', 	 to: "sessions#create"
	delete 'logout', to: "sessions#destroy"

	resources :users do
		member do
			get 'edit_bio',		to: "users#edit_bio"
			get 'edit_name',	to: "users#edit_name"
			get 'edit_title',	to: "users#edit_title"
		end
	end
	resources :educations
	resources :experiences
	resources :examples
	resources :password_resets, only: [:new, :create, :edit, :update]
end
