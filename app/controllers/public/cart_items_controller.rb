class Public::CartItemsController < ApplicationController

  def index
    @cart_item = CartItem.all
    #@item = Item.find(params[:id])
  end

  def create
    @cart_item = CartItem.new
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :amount)
  end

end
