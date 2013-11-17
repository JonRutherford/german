ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "google.com",
  user_name: "jonrutherford001",
  password: "waters69",
  authentication: "plain",
  enable_starttls_auto: true
}

require 'development_mail_interceptor'

ActionMailer::Base.default_url_options[:host] = "localhost:5000"
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?