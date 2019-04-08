class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    :line_items.forEach do |item|
      total += item.quantity * item.price
    end
    return total
  end
end
