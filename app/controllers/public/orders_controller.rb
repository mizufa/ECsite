class Public::OrdersController < ApplicationController
  def index #注文履歴一覧
    @order = current_customer.order_historys.all
  end

  def show #注文履歴詳細
  @order_id = current_customer.order_historys.find(params[:id])
  @order = current_customer.order_historys.all
  @history = OrderHistory.find(params[:id])
  @postage = 800 #送料
  end

  def new
    @order = current_customer.order_historys.new
    @customer = current_customer
    #binding.pry
  end

  def create #注文確定処理
    #order_historyモデルに注文（支払い方法、お届け先、請求金額に送料を合わせた合計金額）を保存する
    order_history = current_customer.order_historys.new(order_history_params) #パラメータの取得
    order_history.save

  #OrderDetailモデルにカート内商品の情報を保存する
    current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
      order_detail = order_history.order_details.new
      order_detail.item_id = cart_item.item_id
      order_detail.amount = cart_item.amount
      order_detail.purchase_price = cart_item.item.with_tax_purchase_price
      order_detail.save
    end
    current_customer.cart_items.destroy_all #カートの中身を削除

    redirect_to orders_completion_path #注文完了画面へ
  end

  def confirm #注文情報確認画面
    @order = current_customer.order_historys.new(order_history_params)
    @cart_items = current_customer.cart_items.all
    @total = 0
    @request = 0
    @postage = 800 #送料
    if params[:order_history][:select_address] == "0"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name + current_customer.first_name
    end
  end

  def completion #注文完了画面
  end

  private

  def order_history_params
    params.require(:order_history).permit(:customer_id, :name, :address, :postal_code, :payment, :item_total, :postage)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_history_id, :purchase_price, :amount)
  end
end
