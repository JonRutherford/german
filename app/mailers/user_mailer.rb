class UserMailer < ActionMailer::Base
  default from: "jonrutherford001@gmail.com"

  def registration_confirmation(user)
    @user = user
    # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(to: email_to(user), subject: "Registered")
  end

  def password_reset(user)
    @user = user
    mail(to: email_to(user), subject: "Password reset")
  end

  private
    def email_to(user)
      "#{user.name} <#{user.email}>"
    end
end
