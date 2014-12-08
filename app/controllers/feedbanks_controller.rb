class FeedbanksController < ApplicationController

	def index
		@currentPage = {:useraccount => "active"};
		@user_name = "Account Login"
		@feedbanks = Feedbank.all
	end

	 def create
  		@Feedbank = Feedbank.new(params[:feedbank])
  		@user = User.find_by_id(session[:remember_token])

  		@Feedbank.save
  		redirect_to @user
  end

  def show
    @currentPage = {:useraccount => "active"};
    @user_name = "Account Login"
    @feedbanks = Feedbank.all
  end 

  def approve_content
    @feedbank  = Feedbank.find(params[:id])
    @feedbank.update_attribute(:approval_status, "true");


    @admin_user = User.find_by_name("Admin");
    redirect_to @admin_user 
  end 

  def disapprove_content
    @feedbank  = Feedbank.find(params[:id])
    @feedbank.destroy


    @admin_user = User.find_by_name("Admin");
    redirect_to @admin_user 
  end 

end
