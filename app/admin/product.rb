ActiveAdmin.register Product do
  decorate_with ProductDecorator
  menu priority: 1, parent: "Товары"
  config.sort_order = "index_desc"

  permit_params :name,
                :price,
                :description,
                :properties,
                :index,
                :featured,
                :category_id,
                option_ids: [],
                product_images_attributes: [:id, :image, :_destroy]
  filter :name
  filter :category
  filter :price

  scope :all, default: true
  scope("Популярные") { |scope| scope.where(featured: true) }

  index do
    selectable_column
    column :id
    column "Фото" do |product|
      image_tag product.cover.url(:thumb), size: '100x79'
    end
    column :index
    column :featured do |product|
      if product.featured?
        status_tag  'Да', :ok
      else
        status_tag  'Нет'
      end
    end
    column :name, class: 'main'
    column :price, class: 'no-wrap'
    actions
  end

  show do
    attributes_table do
      row :id
      row :index
      row :image do
        image_tag product.cover.url(:thumb)
      end
      row :name
      row :featured do
        if product.featured?
          status_tag  'Да', :ok
        else
          status_tag  'Нет'
        end
      end
      row :price
      row :description
      row :properties do
        simple_format product.properties
      end
      row :options do
        product.options.ordered.map(&:to_label).join("<br>").html_safe
      end
      row :created_at
      row :updated_at
    end
  end

  form html: {enctype: "multipart/form-data"} do |f|
    tabs do
      tab 'Детали продукта' do
        f.inputs "Детали продукта" do
          f.input :name
          f.input :index, hint: 'Чем больше значение, тем выше в списке'
          f.input :featured
          f.input :category
          f.input :price
          f.input :description, input_html: {rows: 5}
          f.input :properties, input_html: {rows: 5},
                  hint: "Каждый параметр с новой строки в формате (название параметра) : (значение)"
          f.input :options,
                  collection: product.category.present? ? product.category.options.ordered : Option.all.ordered,
                  as: :multiselect
        end
      end
      tab 'Фото продукта' do
        f.has_many :product_images, allow_destroy: true, heading: false do |image|
          image.input :image, as: :file,
                      hint: (image_tag(image.object.image.url(:medium), size: '419x285') if image.object.image.present?)
          image.actions
        end
      end
    end

    f.actions
  end

end
