class CartItem < ApplicationRecord
  belongs_to :customer #会員に属する
  belongs_to :item #商品に属する
end
