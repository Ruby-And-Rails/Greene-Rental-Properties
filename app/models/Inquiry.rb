class Inquiry < ActiveRecord::Base
  validates :name, presence: true
  
  
  validates :name, length: { minumum:2, maximum: 50 }, :if => :name
  
         
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
    :format => { :with => email_regex },
    :uniqueness => { :case_sensitive => false }
  
  validates :phone, presence: true
  validates :message, presence: true
end
