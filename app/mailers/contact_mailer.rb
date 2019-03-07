class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.new_contact.subject
  #
  def new_contact(contact)
  	@contact = contact
    @greeting = "You have received a new message!"

    mail to: User.first.email, subject: "IMPORTANT New Contact Submission"
  end
end
