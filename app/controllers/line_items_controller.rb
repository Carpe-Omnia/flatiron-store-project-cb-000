class LineItemsController < ApplicationController
  def create
    @item = Item.find(params[:id])
    puts(@item)
    puts(current_user)
    flash[:alert] = "Item added to cart"
    redirect_back(fallback_location: root_path)
  end
end
