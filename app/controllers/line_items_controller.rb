class LineItemsController < ApplicationController
  def create
    puts !!user_signed_in?
    if !user_signed_in?
      flash[:alert] = "Must be signed in to add items to cart"
      redirect_back(fallback_location: :root)
    end
    @cart = Cart.find_or_create_by(user_id: current_user.id)
    @item = Item.find_by(id: params[:item_id])
    @line_item = LineItem.find_or_create_by(item_id: @item.id, cart_id: @cart.id)
    puts "quantity here"
    puts @line_item.quantity
    if @cart.line_items.include?(@line_item)
      @line_item.quantity = @line_item.quantity + 1
    else
      @cart.line_items << @line_item
    end
    @item.inventory -= 1
    puts @cart.line_items
    flash[:alert] = "Item added to cart"
    redirect_back(fallback_location: :root)
  end
end
