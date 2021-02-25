class Digital < ApplicationRecord
    has_many :images
    has_many :order_items

    validates :name, :sku, presence: true
    
end
