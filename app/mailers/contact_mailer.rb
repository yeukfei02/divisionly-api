class ContactMailer < ApplicationMailer
  def contact_email(subject, message)
    mail(to: 'yeukfei02@gmail.com', subject: subject, message: message)
  end
end
