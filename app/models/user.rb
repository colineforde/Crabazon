class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # def confirm!
   # 		welcome_email
   # end

   # private
   # def welcome_email
   # 		VisotorMailer.welcome_email(self).deliver
   # end
end
