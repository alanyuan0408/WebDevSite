class UserMailer < ActionMailer::Base
  default from: "alan.yuan@mail.utoronto.ca"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Testing new mailing feature')
  end

  def update_email(user)
    @user = user
    @YNCNPosts = Item.where(type_of: "YNCNPost").take(3)
    @clubPosts = Item.where(type_of: "ClubPost").take(3)
    mail(to: @user.email, subject: 'Automated Web Club Email')
  end

end
