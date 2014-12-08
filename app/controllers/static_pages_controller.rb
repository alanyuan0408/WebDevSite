class StaticPagesController < ApplicationController
 
  helper_method :login_method

  def login_method
    #helper method to find the cookie login or the user + set the name on the template

    current_user

    if signed_in?
      sign_in(@current_user)
    end

    if session[:remember_token] && User.exists?(:id => session[:remember_token])
      @user = User.find(session[:remember_token])
      @user_name = @user.name
    else
      @user_name = "Account Login"
    end
  end

  def home
    login_method

    @currentPage = {:home => "active"};
    @number_of_users = User.all.length;
  end

  def developer
    login_method

    @currentPage = {:developer => "active"};
  end

  def entrepreneur
    login_method

    @currentPage = {:entrepreneur => "active"};
    @number_of_participants = User.where(:expo_ticket => true).length;
  end

  def news
    login_method

    @currentPage = {:news => "active"};
    @jobPosts = Feedbank.where(:column_type => 3).order("item_date desc")
    #1 is Jobs, #2 is Events, #3 is News, #4 is Research

  end

  def events
    login_method

    @currentPage = {:events => "active"};
    @jobPosts = Feedbank.where(:column_type => 2).order("item_date desc")
    #1 is Jobs, #2 is Events, #3 is News, #4 is Research

  end

  def jobs
    login_method

    @currentPage = {:jobs => "active"};
    @jobPosts = Feedbank.where(:column_type => [1,4]).order("item_date desc")
    #1 is Jobs, #2 is Events, #3 is News, #4 is Research
  end

  def useraccount
    current_user

    if signed_in?
      sign_in(@current_user)
    end

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
