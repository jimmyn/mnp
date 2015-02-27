class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :featured, :boolean
    add_column :products, :index, :integer, default: 0
  end
end
