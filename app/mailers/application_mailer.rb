# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'contact@divisionly.net'
  layout 'mailer'
end
