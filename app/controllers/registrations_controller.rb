class RegistrationsController < Devise::RegistrationsController

  def create
    super
    VisitorMailer.welcome_email(@user).deliver unless @user.invalid?
  end

end