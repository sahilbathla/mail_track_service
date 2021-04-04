# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: Figaro.env.email_from
  layout 'mailer'

  def send_email(email)
    @email = email
    mail(to: email.to, subject: email.subject, cc: email.cc, bcc: email.bcc)
  end
end
