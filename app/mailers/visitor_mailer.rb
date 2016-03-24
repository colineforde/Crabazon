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

  def welcome_new_user(user)
    @user = user

    mail from: 'baronk0401@gmail.com',
         to: @user.email,
         subject: 'Welcome to store!'
  end

end
