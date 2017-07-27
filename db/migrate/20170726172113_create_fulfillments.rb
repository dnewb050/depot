class CreateFulfillments < ActiveRecord::Migration[5.0]
  def change
    create_table :fulfillments do |t|
      t.references :order
      t.integer :ship_type
      t.string :carrier
      t.integer :tracking_number

      t.timestamps
    end
  end
end
