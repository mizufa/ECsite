class Public::CartItemsController < ApplicationController

  def index
    @cart_item = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path #一覧画面へリダイレクト
  end

  def destroy_all
        cart_item = CartItem.find(params[:id])
    cart_item.destroy_all
    redirect_to cart_items_path #一覧画面へリダイレクト
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
