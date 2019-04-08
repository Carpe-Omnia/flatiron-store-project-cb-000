class LineItemsController < ApplicationController
  def create
    if !user_signed_in
      flash[:alert] = "Must be signed in to add items to cart"
      redirect_back(fallback_location: :root)
    else
      @item = Item.find_by(id: params[:item_id])
      puts(@item)
      puts(current_user)
      flash[:alert] = "Item added to cart"
      redirect_back(fallback_location: :root)
    end
  end
end
