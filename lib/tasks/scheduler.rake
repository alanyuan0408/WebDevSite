desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."	
end

task :send_emails => :environment do
  puts "sending emails"

  @user = User.all

  @user.each do |user|
  	 UserMailer.update_email(user).deliver
  end

end

task :send_spam => :environment do
  puts "sending Spam!"

  @user = User.all

  @user.each do |user|
  	 (1..10).each do |i|
  	 	UserMailer.spam_email(user).deliver
  	 end
  end

end