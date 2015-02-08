class UserMailer < ApplicationMailer
  def mail_user(user)
    @user = user
    @url = "http://www.google.com"
    mail(to: @user.email, subject: 'You have violated website rules and are consequently deleted')
  end
end
