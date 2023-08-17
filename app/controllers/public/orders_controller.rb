class Public::OrdersController < ApplicationController
  def show
  end

  def new
    @order = current_customer.order_historys.new
    @customer = current_customer
    #binding.pry
  end

  def create #注文確定処理
  end

  def confirm #注文情報確認画面
    @order = current_customer.order_historys.new(order_history_params)
    @cart_items = current_customer.cart_items.all
    @total = 0
    @request = 0
    @postage = 800
    if params[:order_history][:select_address] == "0"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name + current_customer.first_name
    end
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
