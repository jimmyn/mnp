class OptionsOrdersJoin < ActiveRecord::Migration
  def up
    create_table 'options_orders', id: false do |t|
      t.column 'order_id', :integer
      t.column 'option_id', :integer
    end
  end

  def down
    drop_table 'options_orders'
  end
end
