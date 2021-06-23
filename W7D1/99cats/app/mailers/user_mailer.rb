class UserMailer < ApplicationMailer
  default from: 'Sam Song <everybody@appacademy.io>'

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: user.email, subject: 'Hello World!')
  end
end
