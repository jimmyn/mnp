class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :update, :success]

  def create
    order_params[:option_ids] = order_params[:option_ids].split(',')
    @order = Order.new(order_params)
    if @order.save(validate: false)
      redirect_to order_path(@order)
    else
      render "show"
    end
  end

  def update
    status_changed = @order.status != order_params[:status]
    if @order.update(order_params)
      OrderMailer.new_order(@order).deliver if status_changed
      render 'success'
    else
      render 'show'
    end
  end

  def show
    @order.customer ||= Customer.new
  end

  private

  def order_params
    params.require(:order).permit!
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
