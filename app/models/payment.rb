class Payment < ApplicationRecord
    belongs_to :payment_method
    belongs_to :order

    validates :total, :token, presence: true
    validates :total, numericality: true
  
    def get_payment_method
        PaymentMethod.find(self.payment_method_id).name
    end
end
