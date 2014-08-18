class UserMailer < ActionMailer::Base
  default from: "alan.yuan@mail.utoronto.ca"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Testing new mailing feature')
  end

  def update_email(user)
    @user = user
    @jobPosts = Item.all.take(3)
    mail(to: @user.email, subject: 'Testing Updates')
  end

  def spam_email(user)
    @user = user
    mail(to: @user.email, subject: "Spam wave")
  end

end
