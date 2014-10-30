class StaticPagesController < ApplicationController
 
  def home
    @currentPage = {:home => "active"};
    if session[:remember_token] && User.exists?(:id => session[:remember_token])
      user = User.find(session[:remember_token])
      @user_name = user.name
    else
      @user_name = "Account Login"
    end
  end

  def developer
    @currentPage = {:developer => "active"};
    if session[:remember_token] && User.exists?(:id => session[:remember_token])
      user = User.find(session[:remember_token])
      @user_name = user.name
    else
      @user_name = "Account Login"
    end
  end

  def entrepreneur
    @currentPage = {:entrepreneur => "active"};
    @number_of_participants = User.where(:expo_ticket => true).length;

    if session[:remember_token] && User.exists?(:id => session[:remember_token])
      @user = User.find(session[:remember_token])
      @user_name = @user.name
    else
      @user_name = "Account Login"
    end
  end

  def events
    @currentPage = {:events => "active"};
    if session[:remember_token] && User.exists?(:id => session[:remember_token])
      user = User.find(session[:remember_token])
      @user_name = user.name
    else
      @user_name = "Account Login"
    end
  end

  def jobs
    @currentPage = {:jobs => "active"};
    if session[:remember_token] && User.exists?(:id => session[:remember_token])
      user = User.find(session[:remember_token])
      @user_name = user.name
    else
      @user_name = "Account Login"
    end

    @jobPosts = Item.where(type_of: "JobPost").order("id desc")

  end

  def useraccount
    @currentPage = {:useraccount => "active"};
    if session[:remember_token] && User.exists?(:id => session[:remember_token])
      @user = User.find(session[:remember_token])
      @user_name = @user.name
      redirect_to @user
    else
      @user_name = "Account Login"
      @user = User.new(params[:user])
      if @user.save
        #Handle a successful save.
        redirect_to @user
      else 
        render 'users/new'
      end
    end
  end
  
end
