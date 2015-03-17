class AddPickUpAndDeliveryToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :pick_up_id, :integer
    add_column :orders, :delivery_id, :integer
  end
end
