class CreateProductImages < ActiveRecord::Migration
  def up
    create_table :product_images do |t|
      t.references :product, index: true
      t.timestamps
    end
    add_attachment :product_images, :image
  end
  def down
    drop_table :product_images
  end
end
