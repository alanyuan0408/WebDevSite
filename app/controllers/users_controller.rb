class UsersController < ApplicationController

  def show
    @currentPage = {:useraccount => "active"};

    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @user_name = @user.name

      if @user.admin 
        @users = User.all
        @clubPost = Item.where(type_of: "ClubPost").all
        @jobPost = Item.where(type_of: "JobPost").all
        render 'adminpanel'
      elsif @user.yncn
        @items = Item.where(type_of: "YNCNPost").all
        render 'yncnpanel'
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

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    @user = User.find_by_name("UoftWebDev")
    redirect_to @user
  end

  def new
    @currentPage = {:useraccount => "active"};
  	@user = User.new
    @user_name = "login"
  end

  def edit
    @currentPage = {:useraccount => "active"};
    @user = User.find_by_id(session[:remember_token])
    @user_name = @user.name
  end

  def update
    @currentPage = {:useraccount => "active"};
    @user = User.find_by_id(session[:remember_token])
    @user_name = @user.name

    if @user.update_attributes(params[:user])
        sign_in @user
        redirect_to @user
    else
      @currentPage[:usererror] = "true"
      render 'edit'
    end
  end

end
