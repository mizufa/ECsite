class Public::CartItemsController < ApplicationController

  def index
    @cart_item = current_customer.cart_items.all#CartItem.all
    @total = 0
  end

  def create
     @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]) #(item_id: params[:cart_item][:item_id])が検索条件のカートアイテムのレコードが値として入る
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    #flash[:notice] = "You have updated cart_item successfully."
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path #一覧画面へリダイレクト
  end

  def destroy_all
    current_customer.cart_items.destroy_all #「ログインしているユーザー」のカート内を削除する
    redirect_to cart_items_path #一覧画面へリダイレクト
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
