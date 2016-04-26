# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class InquiryMailerPreview < ActionMailer::Preview
  def new_user
    #user = Inquiry.first
    user = {'name'=>'Chinmay Kumar Sahu','email'=>'chinmay235@gmail.com','phone'=>'9040214490', 'message'=>'Hello World!!!'}
    InquiryMailer.new_user(user.to_h)
    
  end
  def welcome_email
    user = Inquiry.first
    InquiryMailer.welcome_email(user)
  end
end

