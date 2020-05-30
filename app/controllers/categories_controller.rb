class CategoriesController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def children_category
    @children = Category.find(params[:parentCategory]).children
  end

  def grandchildren_category
    @grandchildren = Categorty.find("#{params[:child_id]}").children
  end
end
