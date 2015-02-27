class OrderDecorator < ProductDecorator
  delegate_all

  def product
    object.product
  end

  def customer
    object.customer
  end

  def options
    object.options
  end

end
