class ApplicationMailer < ActionMailer::Base
  default to: "info@route.com", from: "info@route.com"
  layout 'mailer'
end
