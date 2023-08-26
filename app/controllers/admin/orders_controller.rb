class Admin::OrdersController < ApplicationController

  def show #注文履歴詳細
    @order = OrderHistory.find(params[:id])
    @order_details = OrderHistory.all
    @postage = 800 #送料
  end

end
