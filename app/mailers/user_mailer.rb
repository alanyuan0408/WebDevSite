class UserMailer < ActionMailer::Base
  default from: "alan.yuan@mail.utoronto.ca"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Testing new mailing feature')
  end
end
