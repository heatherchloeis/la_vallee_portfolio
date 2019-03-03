class ExamplesController < ApplicationController
	before_action :logged_in_user, 	only: [:create,
		                                     :update,
                                         :destroy]
  before_action :set_example,	 		only: [:update,
                                  	     :destroy]

  def create
  	@example = Example.new(example_params)
  	if @example.save
			flash[:success] = "Congrats (ﾉ●ω●)ﾉ*:･ﾟ✧ You've Successfully Added to Your Portfolio"
		else
			flash[:danger] = "Oh no (づಠ╭╮ಠ)づ Something Seems to Have Gone Wrong with Your Submission! Please Try Again"
  	end
		redirect_to request.referrer || root_url
  end

  def update
  	if @example.update_attributes(example_params)
			flash[:success] = "Congrats (ﾉ●ω●)ﾉ*:･ﾟ✧ You've Successfully Edited Your Portfolio"
		else
			flash[:danger] = "Oh no (づಠ╭╮ಠ)づ Something Seems to Have Gone Wrong with Your Submission! Please Try Again"
		end
		redirect_to request.referrer || root_url
  end

  def destroy
		@example.destroy
		flash[:success] = "This Example Has Been Successfully Deleted o(╥﹏╥)o"
		redirect_to request.referrer || root_url
  end

  private
  	def example_params
  		params.require(:example).permit(:title,
  																		:category,
  																		:content)
  	end

  	def set_example
  		@example = Example.find_by(params[:id])
  	end
end
