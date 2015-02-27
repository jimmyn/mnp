ActiveAdmin.register Review do
  config.sort_order = "updated_at_desc"
  menu priority: 6
  permit_params :name,
                :body,
                :position,
                :company_name,
                :company_url,
                :photo
  filter :name
  filter :company_name

  index do
    selectable_column
    column "Фото" do |comment|
      image_tag comment.photo.url(:thumb), size: '80x80'
    end
    column :name
    column :body
    actions
  end

  show do
    attributes_table do
      row :photo do
        image_tag(review.photo.url(:thumb), size: '80x80') if  review.photo.present?
      end
      row :name
      row :position
      row :company_name
      row :company_url do
        link_to review.company_url
      end
      row :body
      row :created_at
      row :updated_at
    end
  end


  form html: {enctype: "multipart/form-data"} do |f|

    f.inputs "Детали комментария" do
      f.input :photo, as: :file,
              hint: (image_tag(f.object.photo.url(:thumb), size: '80x80') if  f.object.photo.present?)
      f.input :name
      f.input :position
      f.input :company_name
      f.input :company_url
      f.input :body, input_html: {rows: 5}
    end
    f.actions
  end

end
