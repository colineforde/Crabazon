class VisitorMailer < ApplicationMailer
  
  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message

    mail to: 'barontesting4rails@gmail.com',
         from: @email,
         subject: 'New Visitor\'s email'
  end

  def welcome_email(user)
    @user = user
    @url  = 'http://sleepy-garden-69649.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome Email. Thanks for registering with rails-online-shop.')
  end

end
