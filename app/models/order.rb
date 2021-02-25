class Order < ApplicationRecord
  belongs_to :user
  has_one :payment
  has_many :order_items

  def total_amount
    self.order_items.map{|x| x.price * x.quantity}.sum
  end

  def user_name
    User.find(self.user_id).email
  end
end
