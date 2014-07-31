class UsersController < ApplicationController

  def show
    @currentPage = {:useraccount => "active"};
  	@user = User.find(params[:id])
  end

  def create
    @currentPage = {:useraccount => "active"};
  	@user = User.new(params[:user])
  	if @user.save
  		#Handle a successful save.
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
