class Order < ActiveRecord::Base

  belongs_to :user
  belongs_to :pick_up
  belongs_to :delivery
  has_many :order_items


  def total_price
    order_items.inject(0) { |sum, item| sum + item.total_price }
  end

  STATES = [
    [ "New", :new ],
    [ "Dispatched", :dispatched ]
  ]
end