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
          @item_saved = 1
          @items = Item.where(type_of: "YNCNPost").all
          @user = User.find_by_name("YNCN")
          format.html {redirect_to @user}
          format.json {render json: @item}
          format.js
        elsif @item.type_of == "CSSUPost"
          @user = User.find_by_name("CSSU")
          format.html {redirect_to @user}
          format.json {render json: @item}
        elsif @item.type_of == "CSSUPostAdmin"
          @user = User.find_by_name("CSadmin")
          format.html {redirect_to @user}
          format.json {render json: @item}
        elsif @item.type_of == "JobPostAdmin"
          @user = User.find_by_name("CSadmin")
          format.html {redirect_to @user}
          format.json {render json: @item}
        else 
          @user = User.find_by_name("UoftWebDev")
          format.html {redirect_to @user}
          format.json {render json: @item}
        end
    	else 
        @currentPage = {:usererror => "true"};
    	   if @item.type_of == "YNCNPost"
          @user = User.find_by_name("YNCN")
          @item_saved = 0
          @items = Item.where(type_of: "YNCNPost").all
          @user_name = @user.name
          format.html{redirect_to @user}
          format.json {render json: @item}
          format.js
        elsif @item.type_of == "CSSUPost"
          @user = User.find_by_name("CSSU")
          format.html {redirect_to @user}
          format.json {render json: @item}
        elsif @item.type_of == "CSSUPostAdmin"
          @user = User.find_by_name("CSadmin")
          format.html {redirect_to @user}
          format.json {render json: @item}
        elsif @item.type_of == "JobPostAdmin"
          @user = User.find_by_name("CSadmin")
          format.html {redirect_to @user}
          format.json {render json: @item}
        else 
          @user = User.find_by_name("UoftWebDev")
          format.html {redirect_to @user}
          format.json {render json: @item}
        end
    	end

    end
  end

  def destroy
    flash[:success] = "Item destroyed."
    if Item.find(params[:id]).type_of == "YNCNPost"
      Item.find(params[:id]).destroy
      @user = User.find_by_name("YNCN")
      @items = Item.where(type_of: "YNCNPost").all
      respond_to do |format|
          format.html{redirect_to @user}
          format.js
      end
    elsif Item.find(params[:id]).type_of == "CSSUPost"
      Item.find(params[:id]).destroy
      @user = User.find_by_name("CSSU")
      redirect_to @user
    elsif Item.find(params[:id]).type_of == "CSSUPostAdmin"
      Item.find(params[:id]).destroy
      @user = User.find_by_name("CSadmin")
      redirect_to @user
    elsif Item.find(params[:id]).type_of == "JobPostAdmin"
      Item.find(params[:id]).destroy
      @user = User.find_by_name("CSadmin")
      redirect_to @user
    else 
      Item.find(params[:id]).destroy
      @user = User.find_by_name("UoftWebDev")
      redirect_to @user
    end
  end


end
