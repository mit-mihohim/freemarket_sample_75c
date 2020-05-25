class ItemsController < ApplicationController
  def index
  end

  def new 
    @item = Item.new
    @item.item_images.new
  end

  def create  
     Item.create(item_params)
    redirect_to new_item_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :brand, :status, :delivery_charge_bearer, :shipping_area, :delivery_days, :price, item_images_attributes:[:src])

  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :brand, :status, :delivery_charge_bearer, :shipping_area, :delivery_days, :price, item_images_attribute:[:src])
  end

  def buy
  end

end
