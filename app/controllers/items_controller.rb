class ItemsController < ApplicationController

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(params[:item])
  end

  def destroy

  end


end
