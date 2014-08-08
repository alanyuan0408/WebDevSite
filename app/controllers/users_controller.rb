class UsersController < ApplicationController

  def show
    @currentPage = {:useraccount => "active"};

    @user = User.find(params[:id])

      #if we view the page again. current_user will call the cookies
      #and grab the value of cookies on the next signin

    if current_user.remember_token == @user.remember_token
    	  #render the user page
    else 
      render 'permissiondenied'
    end

  end

  def create
    @currentPage = {:useraccount => "active"};
  	@user = User.new(params[:user])
  	if @user.save
  		#Handle a successful save.

      if ENV['RAILS_ENV'].to_s == 'deployment' || ENV['RAILS_ENV'].to_s == ''
        UserMailer.welcome_email(@user).deliver
      end

      sign_in @user
  		redirect_to @user
  	else 
      @currentPage = {:usererror => "true"};
  		render 'new'
  	end
  end

  def new
    @currentPage = {:useraccount => "active"};
  	@user = User.new
  end

end
