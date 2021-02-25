class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product, optional: :true
  belongs_to :digital, optional: :true

  validates :quantity, :price, presence: true
  validates :quantity, :price, numericality: true
  
  validate :assign
  
  def assign
    valid = true

    if self.product_id.nil? and self.digital_id.nil? 
      errors.add(:base, "Must be assigned")
      valid = false
    elsif not self.product_id.nil? and not self.digital_id.nil?
      errors.add(:base, "Only can be assigned to one class")
      valid = false
    end

    return unless valid
  end
end
