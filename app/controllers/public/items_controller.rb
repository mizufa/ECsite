class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
  end

  def create #カートに入れる機能用
    @cart_item = CartItem.new
    @cart_item.save
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :purchase_price)
  end

end