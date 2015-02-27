ActiveAdmin.register Order do

  decorate_with OrderDecorator
  menu priority: 3

  filter :product
  filter :customer
  filter :created_at

  scope :all, default: true
  scope("Не оформлены") { |scope| scope.where(status: 'Не оформлен') }
  scope("Оформлены") { |scope| scope.where(status: 'Оформлен') }

  actions :index, :show, :destroy

  index do
    selectable_column
    column :id
    column 'Товар' do |order|
      order.product
    end
    column 'Покупатель' do |order|
      order.customer
    end
    column 'Статус', class: 'no-wrap', sortable: :status do |order|
      if order.status == 'Оформлен'
        status_tag order.status, :ok
      else
        status_tag order.status
      end
    end
    column :price, class: 'no-wrap'
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :status do
        if order.status == 'Оформлен'
          status_tag order.status, :ok
        else
          status_tag order.status
        end
      end
      row :product
      row :options do
        order.options.ordered.map(&:to_label).join("<br>").html_safe
      end
      row :quantity
      row :price
      row :comment
      row :created_at
    end
  end

  sidebar "Клиент", only: :show, if: proc{ order.customer.present? } do
    attributes_table_for order.customer do
      row 'Имя' do
        link_to order.customer, [:admin, order.customer]
      end
      row 'E-mail' do
        mail_to order.customer.email
      end
      row :phone
    end
  end

end
