class LineItemsController < ApplicationController
  def create
    flash[:alert] = "Item added to cart"
    redirect_back(fallback_location: root_path)
  end
end
