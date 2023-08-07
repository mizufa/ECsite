class Public::OrdersController < ApplicationController
  def show
  end

  def new
    @order = OrderHistory.new
  end

  def confirm
    order = OrderHistory.new(order_history_params)
    order.save
    redirect_to orders_confirm_path
  end

  def index
  end

  private

  def order_history_params
    params.require(:order_history).permit(:customer_id, :name, :address, :postal_code, :payment, :item_total, :postage)
  end
end
