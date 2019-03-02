class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit,
                                        :update]

	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
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
	def edit_bio
		@user = User.find(params[:id])
	end

	def update_bio
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			# Handle a successful user update
			flash[:success] = "Your Bio Has Been Successfully Updated (ﾉ●ω●)ﾉ*:･ﾟ✧"
			redirect_to root_url
		else
			# Handle an unsuccessful user update
			flash[:danger] = "Oh Dear (づಠ╭╮ಠ)づ Something Seems to Have Gone Wrong! Please Try Again"
			render 'edit'
		end
	end

	# Edit Name on Home Page
	def edit_name
		@user = User.find(params[:id])
	end

	def update_name
		@user = User.find(params[:id])
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
	def edit_title
		@user = User.find(params[:id])
	end

	def update_title
		@user = User.find(params[:id])
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
end
