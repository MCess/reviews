class UserMailer < ApplicationMailer
  default from: 'ppearing@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'localhost:3000/sessions/new' 
    mail(to: @user.email, subject: 'Welcome to Pearing!')   
  end

  def eod_review_email(user)
    @user = user
    @url = 'localhost:3000/sessions/new' 
    mail(to: @user.email, subject: 'Hope you had a great day coding! Leave a review for your partner')
  end
end