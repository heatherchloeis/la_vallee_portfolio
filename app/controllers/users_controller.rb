class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit,
                                        :update]

  before_action :set_user, 			 only: [:edit,
  																			:bio_edit,
  																			:name_edit,
  																			:title_edit,
  																			:update]

  after_action  :bio_edit,			 only: :update
  after_action	:name_edit,			 only: :update
  after_action	:title_edit,		 only: :update

	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def bio_edit
    respond_to do |format|
      format.html
      format.js
    end
	end

	def name_edit
    respond_to do |format|
      format.html
      format.js
    end
	end

	def title_edit
    respond_to do |format|
      format.html
      format.js
    end
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

	private
		def user_params
			params.permit(:name,
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
