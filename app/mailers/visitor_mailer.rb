class VisitorMailer < ApplicationMailer
	def contact_email(username, email, message)
    @username = username
    @email = email
    @message = message
    mail(from: @email,
         to: 'coline.forde@gmail.com',
         subject: 'New Visitor\'s Email')
  end
end
