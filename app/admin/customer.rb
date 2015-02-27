ActiveAdmin.register Customer do

  menu priority: 4
  actions :index, :show, :destroy, :edit

  filter :name
  filter :email
  filter :phone

  index do
    selectable_column
    column :id
    column :name, class: 'main'
    column 'E-mail', sortable: :email do |customer|
      mail_to customer.email
    end
    column :phone
    actions
  end

  form do |f|

    f.inputs "Детали клиента" do
      f.input :name
      f.input :phone
      f.input :email
      f.input :comment, input_html: {rows: 5}
    end
    f.actions
  end


  show do
    attributes_table do
      row :id
      row :name
      row :email do
        mail_to customer.email
      end
      row :phone
      row :comment
      row :orders do
        customer.orders.map do |order|
          link_to order, [:admin, order]
        end.join("<br>").html_safe
      end
      row :created_at
      row :updated_at
    end
  end

end
