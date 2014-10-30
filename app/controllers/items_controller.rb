class ItemsController < ApplicationController

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(params[:item])
  	@user = User.find_by_id(session[:remember_token])

	if @item.save
		redirect_to @user
	else 
		redirect_to @user
	end
  end

  def destroy

  end


end
