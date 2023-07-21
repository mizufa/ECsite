class OrderHistory < ApplicationRecord
  belongs_to :customer #会員に属する
  has_many :order_detail, dependent: :destroy
end
