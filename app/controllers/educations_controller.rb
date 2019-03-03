class EducationsController < ApplicationController
	before_action :logged_in_user, only: [:create,
		                                    :update,
                                      	:destroy]
  before_action :set_education,	 only: [:update,
                                      	:destroy]

  def create
  	@education = Education.new(education_params)
  	if @education.save
			flash[:success] = "Congrats (ﾉ●ω●)ﾉ*:･ﾟ✧ You've Successfully Added to Your Education"
		else
			flash[:danger] = "Oh no (づಠ╭╮ಠ)づ Something Seems to Have Gone Wrong with Your Submission! Please Try Again"
  	end
		redirect_to request.referrer || root_url
  end

  def update
		if @education.update_attributes(education_params)
			flash[:success] = "Congrats (ﾉ●ω●)ﾉ*:･ﾟ✧ You've Successfully Edited Your Education"
		else
			flash[:danger] = "Oh no (づಠ╭╮ಠ)づ Something Seems to Have Gone Wrong with Your Submission! Please Try Again"
		end
		redirect_to request.referrer || root_url
  end

  def destroy
		@education.destroy
		flash[:success] = "This Section Has Been Successfully Deleted o(╥﹏╥)o"
		redirect_to request.referrer || root_url
  end

  private
  	def education_params
  		params.require(:education).permit(:school,
  																			:year,
  																			:degree,
  																			:major)
  	end

  	def set_education
  		@education = Education.find(params[:id])
  	end
end
