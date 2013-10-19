class TechnicalSupportMailer < ActionMailer::Base
  default to: configus.techical_support_email

  def problem(from, subject, body)
    mail from: "#{from[:name]} <#{from[:email]}>", subject: subject, body: body
  end
end
