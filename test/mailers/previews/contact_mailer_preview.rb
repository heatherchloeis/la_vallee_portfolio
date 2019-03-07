# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/new_contact
  def new_contact
  	@contact = Contact.new(name: "Blah Animations",
  							 email: "headblah@blahanimations.com",
  							 message: "Lorem ipsum")
    ContactMailer.new_contact(@contact)
  end

end
