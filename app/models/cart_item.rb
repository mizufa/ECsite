class CartItem < ApplicationRecord
  belongs_to :customer #会員に属する
  belongs_to :item #商品に属する

  ## 小計を求めるメソッド
def subtotal
    item.with_tax_purchase_price * amount
end


end
