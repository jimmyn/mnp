ActiveAdmin.register AdminUser do
  menu menu priority: 8, label: proc{ I18n.t("active_admin.admin_users") }
  permit_params :email, :password, :password_confirmation

  filter :email

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Детали пользователя" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
