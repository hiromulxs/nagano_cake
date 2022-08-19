class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shipping_name
      t.string :shipping_postal_code
      t.string :shipping_address
      t.integer :billing_amount
      t.integer :postage
      t.integer :pay_type
      t.integer :status
      t.timestamps
    end
  end
end
