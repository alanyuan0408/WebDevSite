class UsersController < ApplicationController
  
  layout "userlayout"

  def show 
  	@user = User.find(params[:id])

  	if @user.blank
  		render 'new'
  	end
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		#Handle a successful save.
  		redirect_to @user
  	else 
  		render 'new'
  	end
  end

  def new
  	@user = User.new
  end

end
