class UsersController < ApplicationController

  def show
    @currentPage = {:useraccount => "active"};

    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @user_name = @user.name

      if @user.admin
        @users = User.all
        render 'adminpanel'
      elsif current_user.remember_token == @user.remember_token
          #render the user page
      else 
        render 'permissiondenied'
      end
    else
      render 'permissiondenied'
    end
  end

  def create
    @currentPage = {:useraccount => "active"};
  	@user = User.new(params[:user])
    @user_name = "Login"
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
    @user_name = "login"
  end

end
