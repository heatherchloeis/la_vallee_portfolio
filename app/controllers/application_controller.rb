class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include SessionsHelper
	
	def home
		@title = "Home"
	end	

	def about
		@title = "About Myself"
	end

	def works
		@title = "My Work"
		@example = Example.new
		@examples = Example.all
	end

	def resume
		@title = "My Resume"
		@educations = Education.all
		@education = Education.new
		@experiences = Experience.all
		@experience = Experience.new
	end

	private
		# Confirms logged-in user
		def logged_in_user
			unless logged_in?
				store_location
				flash[:danger] = "Please log in (ﾉಠ_ಠ)ﾉ 彡 ┻━┻"
				redirect_to login_url
			end
		end
end
