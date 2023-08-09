class Public::OrdersController < ApplicationController
  def show
  end

  def new
    @order = OrderHistory.new
    @customer = current_customer
  end
  
  def create #注文確定
  end

  def confirm #注文情報確認画面
    order = OrderHistory.new(order_history_params)
    order.save
    redirect_to orders_confirm_path
  end

  def completion #注文完了画面
  end

  def index
  end

  private

  def order_history_params
    params.require(:order_history).permit(:customer_id, :name, :address, :postal_code, :payment, :item_total, :postage)
  end
end
