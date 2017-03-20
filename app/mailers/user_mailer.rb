class UserMailer < ApplicationMailer
  default from: 'admin@example.com'

  def greetings_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome recruit!')
  end
end
