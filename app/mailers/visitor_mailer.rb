class VisitorMailer < ApplicationMailer
  default from: "from@example.com"
  
  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message

    mail to: 'baronjetso@gmail.com',
         from: @email,
         subject: 'New Visitor\'s email'
  end

  # def welcome_new_user(user)
  #   @user = user

  #   mail from: 'baronjetso@gmail.com',
  #        to: @user.email,
  #        subject: 'Welcome to store!'
  # end

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome Email. Thanks for registering with rails-online-shop.')
  end

end
