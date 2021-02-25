class Product < ApplicationRecord
    has_one :image
    has_many :order_items

    validates :name, :sku, presence: true
    
end         
