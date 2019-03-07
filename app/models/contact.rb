class Contact < ApplicationRecord
	before_save :downcase_email

	validates :name,	presence: true
	validates :email, presence: true, length: {  maximum: 240 }, 
										format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :message, presence: true

	# Sends the password reset email
	def send_new_contact_email
		ContactMailer.new_contact(self).deliver_now
	end

	private
		# Converts email to lowercase for uniqueness
		def downcase_email
			self.email = email.downcase
		end
end
