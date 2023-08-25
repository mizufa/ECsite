class Admin::HomesController < ApplicationController

  def top #注文履歴一覧
    @orders = OrderHistory.all
    @details = OrderDetail.all
  end
end
