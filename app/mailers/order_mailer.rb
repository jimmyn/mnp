class OrderMailer < ActionMailer::Base
  include ActiveadminSettings::Helpers
  default from: "info@mnp-stroy.ru"

  def new_order(order)
    @order = order
    mail(to: settings_value('Email'), subject: order)
  end
end
