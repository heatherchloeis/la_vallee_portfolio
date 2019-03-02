class ExperiencesController < ApplicationController
	before_action :logged_in_user, only: [:create,
		                                    :update,
                                      	:destroy]
  before_action :set_experience,	 only: [:update,
                                      		:destroy]

  def create
  	@experience = Experience.new
  	if @experience.save
			flash[:success] = "Congrats (ﾉ●ω●)ﾉ*:･ﾟ✧ You've Successfully Added to Your Experience"
		else
			flash[:danger] = "Oh no (づಠ╭╮ಠ)づ Something Seems to Have Gone Wrong with Your Submission! Please Try Again"
  	end
		redirect_back_or root_url
  end

  def update
		if @experience.update_attributes(education_params)
			flash[:success] = "Congrats (ﾉ●ω●)ﾉ*:･ﾟ✧ You've Successfully Edited Your Experience"
		else
			flash[:danger] = "Oh no (づಠ╭╮ಠ)づ Something Seems to Have Gone Wrong with Your Submission! Please Try Again"
		end
		redirect_back_or root_url
  end

  def destroy
		@experience.destroy
		flash[:success] = "This Section Has Been Successfully Deleted o(╥﹏╥)o"
		redirect_to request.referrer || root_url
  end

  private
  	def education_params
  		params.require(:experience).permit(:company,
  																			 :location,
  																			 :title,
  																			 :year,
  																			 :desc)
  	end

  	def set_experience
  		@experience = Experience.find(params[:id])
  	end
end
