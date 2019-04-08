class CartsController < ApplicationController
  def checkout
    if current_cart.line_items.length == 0
      flash[:alert] = "Must have stuff in your cart to checkout"
      redirect_back(fallback_location: :root)
    end
    @order = Order.create
    @order.user_id = current_user.id
    @order.cart_id = current_cart.id
    @order.total = current_cart.total
    @order.save
  end
end
