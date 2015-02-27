class ProductDecorator < Draper::Decorator
  delegate_all
  include ActionView::Helpers::NumberHelper

  def price
    number_to_currency object.price, precision: 0, delimiter: ''
  end
end
