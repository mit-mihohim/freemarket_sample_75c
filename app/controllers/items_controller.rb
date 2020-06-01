class ItemsController < ApplicationController
  def index

  end

  def show
    @item = Item.find(params[:id])
    @item.item_images
  end

  def new 
    @item = Item.new
    @item.item_images.new
    @parents = Category.where(ancestry: nil)
  end


  def create
    begin
      @item = Item.new(item_params)
      if @item.save
          redirect_to root_path, notice: "出品が完了しました"
        else
          redirect_to new_item_path, alert: "必須項目を入力して下さい"
        end
    rescue => e
      puts "エラーが発生しました"
      Rails.logger.debug e.message
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy 
  end

  def buy
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :brand, :status, :delivery_charge_bearer, :prefecture_id, :delivery_days, :price, [item_images_attributes: [:src, :_destroy, :id]]).merge(seller_id: current_user.id)
  end

end
