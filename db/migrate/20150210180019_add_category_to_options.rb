class AddCategoryToOptions < ActiveRecord::Migration
  def change
    add_reference :options, :category, index: true
  end
end
