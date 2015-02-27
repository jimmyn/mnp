ActiveAdmin.register Category do

  menu priority: 3, parent: "Товары"

  permit_params :name, product_ids: []
  filter :name

  index do
    selectable_column
    column :name, class: 'main'
    column "Количество продуктов" do |category|
      category.products.count
    end
    actions
  end

  form do |f|

    f.inputs "Детали категории" do
      f.input :name
      f.input :products, as: :multiselect
    end
    f.actions
  end

end
