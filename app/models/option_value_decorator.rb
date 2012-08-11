Spree::OptionValue.class_eval do
  validates_numericality_of :price,  :allow_nil => true
  validates_numericality_of :weight,  :allow_nil => true
  validates_numericality_of :width,   :allow_nil => true
  validates_numericality_of :height,  :allow_nil => true
  validates_numericality_of :depth,  :allow_nil => true
  
  after_update :adjust_variant_modifiers

  def adjust_variant_modifiers
    updated_attributes = [:price, :weight, :width, :height, :depth].select { |x| self.send(:"#{x}_changed?") }

    # make sure variants have a product!
    variants.joins(:product).each do |variant|
      updated_values = updated_attributes.inject({}) { |mem, attribute| mem[attribute] = variant.send(:"calculate_#{attribute}"); mem }
      variant.update_attributes(updated_values) unless updated_values.blank?
    end unless updated_attributes.blank?
  end

end