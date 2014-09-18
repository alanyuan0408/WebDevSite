class ItemsController < ApplicationController

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(params[:item])

    respond_to do |format|
      
    	if @item.save
    		#Handle a successful save.
        if @item.type_of == "YNCNPost"
          @user = User.find_by_name("YNCN")
          format.html {redirect_to @user}
      		format.json {render json: @item}
        else 
          @user = User.find_by_name("UoftWebDev")
          format.html {redirect_to @user}
          format.json {render json: @item}
        end
    	else 
        @currentPage = {:usererror => "true"};
    	  render 'new'
    	end

    end
  end

  def destroy
    flash[:success] = "Item destroyed."
    if Item.find(params[:id]).type_of == "YNCNPost"
      Item.find(params[:id]).destroy
      @user = User.find_by_name("YNCN")
      redirect_to @user
    else 
      Item.find(params[:id]).destroy
      @user = User.find_by_name("UoftWebDev")
      redirect_to @user
    end
  end

end
