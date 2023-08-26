class Admin::OrdersController < ApplicationController

  def show #注文履歴詳細
    @order = OrderHistory.find(params[:id])
    @order_details = OrderHistory.all
  end

end
