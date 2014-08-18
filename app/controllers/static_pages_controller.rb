class StaticPagesController < ApplicationController
 
  def home
    @currentPage = {:home => "active"};
  end

  def developer
    @currentPage = {:developer => "active"};
  end

  def entrepreneur
    @currentPage = {:entrepreneur => "active"};
  end

  def jobs
    @currentPage = {:jobs => "active"};
    jobPost = Item.all

    if jobPost.size > 3
      @jobPosts = Item.all.take(3)
    else 
      @jobPosts = Item.all
    end
  end

  def useraccount
    @currentPage = {:useraccount => "active"};
    @user = User.new(params[:user])
    if @user.save
      #Handle a successful save.
      redirect_to @user
    else 
      render 'users/new'
    end
  end
  
end
