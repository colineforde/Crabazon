class RegistrationsController < Devise::RegistrationsController

  def create
    super
    VisitorMailer.welcome_email(@user).deliver unless @user.invalid?
    flash[:success] = "Thanks for your register! Please check your email!"
  end

end