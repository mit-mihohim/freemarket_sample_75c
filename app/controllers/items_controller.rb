class ItemsController < ApplicationController
  before_action :move_to_root_path, except: [:index, :show], unless: :user_signed_in?
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.where(buyer_id: nil).order("created_at DESC").limit(3)
  end

  def show
    @main_image = @item.item_images.first
    @grandchild_category = @item.category
    @child_category = @grandchild_category.parent
    @parent_category = @child_category.parent
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
    @grandchild = @item.category
    @child = @grandchild.parent
    @parent = @child.parent
    @grandchildren = @child.children
    @children = @parent.children
    @parents = Category.where(ancestry: nil)
  end

  def update
    if @item.update(item_params)
      #showアクション完成後に、遷移先を商品詳細ページに変更する
      redirect_to root_path, notice: "変更内容を保存しました"
    else
      redirect_to edit_item_path(@item), alert: "必須項目を入力して下さい"
    end
  end

  def destroy
    if @item.destroy
      flash[:notice] = "削除が完了しました"
      redirect_to root_path
    else
      flash[:alert] = "削除できませんでした"
      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :brand, :status, :delivery_charge_bearer, :prefecture_id, :delivery_days, :price, [item_images_attributes: [:src, :_destroy, :id]]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root_path
    flash[:alert] = "ログインが必要です"
    redirect_to root_path
  end

  def authenticate_user
    if Item.find(params[:id]).seller != current_user
      redirect_to root_path
    end
  end
end
