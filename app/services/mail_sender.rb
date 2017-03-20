class MailSender < Struct.new(:user)
  def send_email
    UserMailer.greetings_email(user).deliver_now
  end
end
