class UsersController < ApplicationController

  def show
    @currentPage = {:useraccount => "active"};

    if User.exists?(params[:id])
      @user = User.find(params[:id])

      if @user.admin 
        render 'adminpanel'
      elsif current_user.remember_token == @user.remember_token
          #render the user page
      else 
        render 'permissiondenied'
      end
    else
      render 'permissiondenied'
    end

      #if we view the page again. current_user will call the cookies
      #and grab the value of cookies on the next signin

  end

  def create
    @currentPage = {:useraccount => "active"};
  	@user = User.new(params[:user])
  	if @user.save
  		#Handle a successful save.

      if Rails.env.production?
        UserMailer.welcome_email(@user).deliver
        #mail is not config for development/
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
