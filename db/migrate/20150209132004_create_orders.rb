class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :product, index: true
      t.integer :price

      t.timestamps
    end
  end
end
