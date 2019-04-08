class LineItemsController < ApplicationController
  def create
    @item = Item.find_by(id: params[:item_id])
    puts(@item)
    puts(current_user)
    flash[:alert] = "Item added to cart"
    redirect_back(fallback_location: :root)
  end
end
