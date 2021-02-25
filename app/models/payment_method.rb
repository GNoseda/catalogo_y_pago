class PaymentMethod < ApplicationRecord
    has_many :payments

    validates :name, :code, presence: true
  
    def self.options
        PaymentMethod.all.map{|x| [x.name,x.id]}
    end
end
