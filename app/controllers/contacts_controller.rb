class ContactsController < ApplicationController
	def new
		@title = "Let's Connect"
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			@contact.send_new_contact_email
			flash[:success] = "Thank You for Reaching Out (ﾉ●ω●)ﾉ*:･ﾟ✧ I'll Be Sure to Respond Promptly!"
		else
			flash[:danger] = "Oh Dear (づಠ╭╮ಠ)づ Something Seems to Have Gone Wrong with Your Submission! Please Try Again"
			render 'new'
		end
	end

	private
		def contact_params
			params.require(:contact).permit(:name,
																			:email,
																			:message)
		end
end
