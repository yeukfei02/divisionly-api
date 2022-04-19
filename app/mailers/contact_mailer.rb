# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def contact_email(subject, message)
    @message = message
    mail(to: %w[yeukfei02@gmail.com yeukfei08@gmail.com], subject: subject)
  end
end
