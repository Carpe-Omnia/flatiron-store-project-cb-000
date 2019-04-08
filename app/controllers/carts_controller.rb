class CartsController < ApplicationController
  def checkout
    if current_cart.line_items.length == 0
      flash[:alert] = "Must have stuff in your cart to checkout"
      redirect_back(fallback_location: :root)
    end
    @order = Order.create
    @cart = current_cart
    @order.user_id = current_user.id
    @order.cart = current_cart
    @order.total = current_cart.total
    current_cart.order_id = @order.id
    current_cart.save
    @order.save
  end
end
