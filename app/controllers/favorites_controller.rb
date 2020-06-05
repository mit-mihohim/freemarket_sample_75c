class FavoritesController < ApplicationController
  
  def create
    @favorite = Favorite.create(user_id: current_user.id, item_id: params[:item_id])
    @item = Item.all
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, item_id: params[:item_id])
    @favorite.destroy
    @item = Item.all  
  end

end
