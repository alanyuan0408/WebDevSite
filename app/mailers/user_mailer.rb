class UserMailer < ActionMailer::Base
  default from: "alan.yuan@mail.utoronto.ca"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Testing new mailing feature')
  end

  def update_email(user)
    @user = user
    @meeting = Club.all.take(1)
    mail(to: @user.email, subject: @mail.title)
    @jobPosts = Item.all.take(3)
  end
end
