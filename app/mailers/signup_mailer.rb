class SignupMailer < ApplicationMailer
  default from: 'welcome@divisionly.net'

  def signup_mail(to_email, first_name, last_name)
    @url = 'divisionly.net'
    subject = "Welcome to #{@url}"
    @email = to_email
    @username = "#{first_name} #{last_name}"
    mail(to: to_email, subject: subject)
  end
end
