class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new #商品新規登録
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :purchase_price)
  end
end
