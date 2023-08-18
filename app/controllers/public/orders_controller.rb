class Public::OrdersController < ApplicationController
  def show
  end

  def new
    @order = current_customer.order_historys.new
    @customer = current_customer
    #binding.pry
  end

  def create #注文確定処理
    current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
      cart_item = OrderDetail.new(order_detail_params) #カート内商品のパラメータ取得
      #cart_item = CartdItem.new #カート内を初期化
      cart_item.item_id = cart_items.item_id
      cart_item.amount = cart_items.amount
      cart_item.purchase_price = (cart_items.items.purchase_price*1.10).floor #税込にする
      cart_item.order_history_id = @order.id #注文idを注文商品に紐付け
      cart_item.save
    end
    current_customer.cart_items.destroy_all #カートの中身を削除

    order = current_customer.order_historys.new(order_history_params) #注文詳細を保存 #パラメータの取得
    order.item_total = @request
    order.postage = @postage
    order.save
    redirect_to orders_completion_path #注文完了画面へ
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

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_history_id, :purchase_price, :amount)
  end
end
