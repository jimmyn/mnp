class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.string :name
      t.string :position
      t.string :company_name
      t.string :company_url

      t.timestamps
    end
    add_attachment :reviews, :photo
  end
end
