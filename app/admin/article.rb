ActiveAdmin.register Article, as: "Post" do
  # decorate_with ArticleDecorator
  config.sort_order = "updated_at_desc"
  menu priority: 5
  permit_params :title, :body, :image
  permit_params :title,
                :body,
                :image
  filter :title
  filter :updated_at

  index do
    selectable_column
    column :title, class: 'main'
    column :updated_at, class: 'no-wrap'
    actions
  end

  show do
    attributes_table do
      row :id
      row :image do
        image_tag(post.image.url(:thumb)) if post.image.present?
      end
      row :title
      row :body do
        post.body.html_safe
      end
      row :created_at
      row :updated_at
    end
  end

  form html: {enctype: "multipart/form-data"} do |f|

    f.inputs "Детали новости" do
      f.input :title
      f.input :image, as: :file,
              hint: (image_tag(f.object.image.url(:thumb)) if  f.object.image.present?)
      f.input :body, as: :rich_text
    end
    f.actions
  end

end
