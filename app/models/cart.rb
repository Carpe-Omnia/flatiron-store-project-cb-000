class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    cost = 0
    self.line_items.each do |line_item|
      cost += line_item.quantity * line_item.item.price
    end
    return cost
  end
end
