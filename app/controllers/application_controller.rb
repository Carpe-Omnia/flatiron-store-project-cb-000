class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_cart
    if user_signed_in?
      Cart.find_by(user_id: current_user.id)
    else
      nil
    end
  end
end
