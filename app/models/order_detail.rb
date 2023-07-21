class OrderDetail < ApplicationRecord
  belongs_to :item #商品に属する
end
