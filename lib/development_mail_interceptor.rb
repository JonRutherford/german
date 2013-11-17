class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = "jr_rutherford@hotmail.com"
  end
end