class CategoriesController < ApplicationController
  before_action :set_category, only: :show

  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    @items = @category.set_items
    @items = @items.where(buyer_id: nil).order("created_at DESC").page(params[:page]).per(9)
  end

  def children_category
    @children = Category.find(params[:parentCategory]).children
  end

  def grandchildren_category
    @grandchildren = Category.find(params[:childCategory]).children
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

end
