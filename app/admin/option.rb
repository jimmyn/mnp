ActiveAdmin.register Option do
  menu priority: 2, parent: "Товары"

  permit_params :name, :price, :category_id
  filter :name
  filter :category

  index do
    selectable_column
    column :name, class: 'main'
    column :category, class: 'no-wrap'
    column :price, class: 'no-wrap'
    actions
  end

  form do |f|

    f.inputs "Детали параметра" do
      f.input :name
      f.input :price
      f.input :category
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row :category
      row :created_at
      row :updated_at
    end
  end


end
