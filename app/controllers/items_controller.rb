class ItemsController < ApplicationController
  def index
  end

  def new 
    @item = Item.new
    @item.item_images.new
  end

  def create  
    begin
      @item = Item.new(item_params)
        if @item.save
          redirect_to root_path, notice: "出品が完了しました"
        else
          render :new
        end
    rescue => e
      puts "エラーが発生しました"
      Rails.logger.debug e.message
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :brand, :status, :delivery_charge_bearer, :shipping_area, :delivery_days, :price, [item_images_attributes:[:src, :_destroy, :id]]).merge(seller_id: current_user.id)
  end

end
