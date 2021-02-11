class ItemsController < ApplicationController

  def index
    #@items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
  end

  def edit
  end

  def show
  end
  
end
