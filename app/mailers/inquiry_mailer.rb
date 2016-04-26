class InquiryMailer < ApplicationMailer
  default :from => "notifications@greenerentalproperty.com"
 
  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end

  def new_user(user)
    @user = user
    mail to: user['email'], subject: "Hello!"
  end
end