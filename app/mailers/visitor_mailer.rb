class VisitorMailer < ApplicationMailer

  default from: "from@example.com"
  
  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message

    mail to: 'baronk0401@gmail.com',
         from: @email,
         subject: 'New Visitor\'s email'
  end
end
