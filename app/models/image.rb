class Image < ApplicationRecord
  belongs_to :digital, optional: :true
  belongs_to :product, optional: :true

  validates :url, presence: true
    
  validate :assign
  
  def assign
    valid = true

    if self.product_id.nil? and self.digital_id.nil? 
      errors.add(:base, "Must be assigned")
      valid = false
    elsif not self.product_id.nil? and not self.digital_id.nil?
      errors.add(:base, "Only can be assigned to one class")
      valid = false
    elsif not self.product_id.nil?
      product_count = Image.where(product_id: self.product_id).count
      if product_count > 0
        errors.add(:base, "Product has already an image assigned")
        valid = false  
      end
    end

    return unless valid
  end

end
