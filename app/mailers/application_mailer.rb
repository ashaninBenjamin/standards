class ApplicationMailer < ActionMailer::Base
  default_url_options[:host] = configus.action_mailer.default_host
  default from: configus.action_mailer.default_from,
          content_transfer_encoding: '7bit'
end
