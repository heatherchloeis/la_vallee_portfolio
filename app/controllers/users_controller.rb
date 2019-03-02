class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit,
                                        :update]

  before_action :set_user, 			 only: [:edit,
  																			:update,
  																			:update_bio,
  																			:update_name,
  																			:update_title]

	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		if @user.update_attributes(user_params)
			# Handle a successful user update
			flash[:success] = "Your Settings Have Been Successfully Updated (ﾉ●ω●)ﾉ*:･ﾟ✧"
			redirect_to root_url
		else
			# Handle an unsuccessful user update
			flash[:danger] = "Oh Dear (づಠ╭╮ಠ)づ Something Seems to Have Gone Wrong! Please Try Again"
			render 'edit'
		end
	end

	# Edit Bio on About Page
	def update_bio
		if @user.update_attributes(user_params)
			# Handle a successful user update
			flash[:success] = "Your Bio Has Been Successfully Updated (ﾉ●ω●)ﾉ*:･ﾟ✧"
			redirect_back_or root_url
		else
			# Handle an unsuccessful user update
			flash[:danger] = "Oh Dear (づಠ╭╮ಠ)づ Something Seems to Have Gone Wrong! Please Try Again"
			render 'edit'
		end
	end

	# Edit Name on Home Page
	def update_name
		if @user.update_attributes(user_params)
			# Handle a successful user update
			flash[:success] = "Your Name Has Been Successfully Updated (ﾉ●ω●)ﾉ*:･ﾟ✧"
			redirect_to root_url
		else
			# Handle an unsuccessful user update
			flash[:danger] = "Oh Dear (づಠ╭╮ಠ)づ Something Seems to Have Gone Wrong! Please Try Again"
			render 'edit'
		end
	end

	# Edit Title on Home Page
	def update_title
		if @user.update_attributes(user_params)
			# Handle a successful user update
			flash[:success] = "Your Title Has Been Successfully Updated (ﾉ●ω●)ﾉ*:･ﾟ✧"
			redirect_to root_url
		else
			# Handle an unsuccessful user update
			flash[:danger] = "Oh Dear (づಠ╭╮ಠ)づ Something Seems to Have Gone Wrong! Please Try Again"
			render 'edit'
		end
	end

	private
		def user_params
			params.require(:user).permit(:name,
																	 :email,
																	 :password,
																	 :password_confirmation,
																	 :title,
																	 :bio)
		end

		def set_user
			@user = User.find(params[:id])
		end
end
