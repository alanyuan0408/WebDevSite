class ItemsController < ApplicationController

  def new
    @currentPage = {:useraccount => "active"};
  	@item = Item.new
    @user_name = "YNCN"
  end

  def create
    @currentPage = {:useraccount => "active"};
  	@item = Item.new(params[:item])
    @user_name = "YNCN"

    @item.type_of = "YNCNPost"
  	if @item.save
  		#Handle a successful save.

  		@user = User.find_by_name("YNCN")
    	redirect_to @user
  	else 
      @currentPage = {:usererror => "true"};
  	  render 'new'
  	end
  end

  def destroy
    Item.find(params[:id]).destroy
    flash[:success] = "Item destroyed."
    @user = User.find_by_name("YNCN")
    redirect_to @user
  end

end
