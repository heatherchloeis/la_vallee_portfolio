Rails.application.routes.draw do
	root 'application#home'
	get '/about',		 to: "application#about"
	get '/resume',	 to: "application#resume"
	get '/work',		 to: "application#work"
	get '/contact',  to: "contacts#new"
	post '/contact', to: "contacts#create"
	get '/login', 	 to: "sessions#new"
	post '/login', 	 to: "sessions#create"
	delete 'logout', to: "sessions#destroy"

	resources :users do
		member do
			get 'bio_edit',		to: "users#bio_edit",		as: 'bio_edit'
			get 'name_edit',	to: "users#name_edit",	as: 'name_edit'
			get 'title_edit',	to: "users#title_edit",	as: 'title_edit'
		end
	end
	resources :educations
	resources :experiences
	resources :examples
	resources :contacts, 				only: [:new, :create]
	resources :password_resets, only: [:new, :create, :edit, :update]
end
