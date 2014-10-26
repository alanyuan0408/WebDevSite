class StaticPagesController < ApplicationController
 
  def home
    @currentPage = {:home => "active"};
    if session[:remember_token] && User.exists?(:id => session[:remember_token])
      user = User.find(session[:remember_token])
      @user_name = user.name
    else
      @user_name = "Login"
    end
  end

  def developer
    @currentPage = {:developer => "active"};
    if session[:remember_token] && User.exists?(:id => session[:remember_token])
      user = User.find(session[:remember_token])
      @user_name = user.name
    else
      @user_name = "Login"
    end
  end

  def entrepreneur
    @currentPage = {:entrepreneur => "active"};
    if session[:remember_token] && User.exists?(:id => session[:remember_token])
      user = User.find(session[:remember_token])
      @user_name = user.name
    else
      @user_name = "Login"
    end
  end

  def events
    @currentPage = {:events => "active"};
    if session[:remember_token] && User.exists?(:id => session[:remember_token])
      user = User.find(session[:remember_token])
      @user_name = user.name
    else
      @user_name = "Login"
    end
  end

  def jobs
    @currentPage = {:jobs => "active"};
    if session[:remember_token] && User.exists?(:id => session[:remember_token])
      user = User.find(session[:remember_token])
      @user_name = user.name
    else
      @user_name = "Login"
    end

    jobPost = Item.all
    if jobPost.size > 3
      @jobPosts = Item.all.take(3)
    else 
      @jobPosts = Item.all
    end
  end

  def useraccount
    @currentPage = {:useraccount => "active"};
    if session[:remember_token] && User.exists?(:id => session[:remember_token])
      @user = User.find(session[:remember_token])
      @user_name = @user.name
      redirect_to @user
    else
      @user_name = "Login"
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
