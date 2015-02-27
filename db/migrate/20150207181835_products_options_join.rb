class ProductsOptionsJoin < ActiveRecord::Migration
  def up
    create_table 'options_products', id: false do |t|
      t.column 'product_id', :integer
      t.column 'option_id', :integer
    end
  end

  def down
    drop_table 'options_products'
  end
end
