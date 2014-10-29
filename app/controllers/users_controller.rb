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
      elsif current_user.remember_token == @user.remember_token
          #render the user page
      else
        @user = User.find(params[:id])
        @user_name = @user.name
        render 'permissiondenied'
      end
    else
      @user = "Mail Login"
      render 'permissiondenied'
    end
  end

  def create
    @currentPage = {:useraccount => "active"};
  	@user = User.new(params[:user])
    @user_name = "Mail Login"

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
    @user_name = "Mail login"
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

  def register_expo
    @user = User.find_by_id(session[:remember_token])
    @user.update_attribute(:expo_ticket, true);
    @currentPage = {:entrepreneur => "active"};
    @user_name = @user.name
    @number_of_participants = User.where(:expo_ticket => true).length;
    render 'static_pages/entrepreneur'
  end 

  def unregister_expo
    @user = User.find_by_id(session[:remember_token])
    @user.update_attribute(:expo_ticket, false);
    @currentPage = {:entrepreneur => "active"};
    @user_name = @user.name
    @number_of_participants = User.where(:expo_ticket => true).length;
    render 'static_pages/entrepreneur'
  end 

end
