class LineItemsController < ApplicationController
  def create
    puts !!user_signed_in?
    if !user_signed_in?
      flash[:alert] = "Must be signed in to add items to cart"
      redirect_back(fallback_location: :root)
    end
    @cart = Cart.find_or_create_by(user_id: current_user.id)
    @item = Item.find_by(id: params[:item_id])
    @line_item = LineItem.new(item_id: @item.id)
    @cart.line_items << @line_item
    puts @cart.line_items
    flash[:alert] = "Item added to cart"
    redirect_back(fallback_location: :root)
  end
end
