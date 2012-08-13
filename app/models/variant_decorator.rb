Spree::Variant.class_eval do
  after_update :adjust_variant_modifiers, :if => :is_master
  before_create :set_variant_modifiers

  def self.by_option_value_ids(option_value_ids, product_id)
    Spree::Variant.find_by_sql(['
        SELECT
          spree_option_values_variants.variant_id as id
        FROM
          spree_option_values_variants, spree_variants
        WHERE
          spree_option_values_variants.option_value_id IN (?) 
            AND
          spree_option_values_variants.variant_id = spree_variants.id
            AND
          spree_variants.product_id = ?
        GROUP BY
          spree_option_values_variants.variant_id
        HAVING
          COUNT(spree_option_values_variants.variant_id) = ?',
        option_value_ids, product_id, option_value_ids.length
      ]).map(&:reload)
  end

  def calculate_price(master_price=nil)
    calculate_parameter :price, master_price
  end
  def calculate_weight(master_weight = nil)
    calculate_parameter :weight, master_weight
  end
  def calculate_width(master_width=nil)
    calculate_parameter :width, master_width
  end
  def calculate_height(master_height = nil)
    calculate_parameter :height, master_height
  end
  def calculate_depth(master_depth = nil)
    calculate_parameter :depth, master_depth
  end

  # Ensures a new variant takes the product master price when price is not supplied
  def check_price
    if self.price.blank?
      raise "Must supply price for variant or master.price for product." if self.is_master
      self.price = calculate_price
    end
  end

  def adjust_variant_modifiers
    updated_attributes = [:price, :weight, :width, :height, :depth].select { |x| self.send(:"#{x}_changed?") }
    product.variants.each do |variant|
      updated_values = updated_attributes.inject({}) { |mem, attribute| mem[attribute] = variant.send(:"calculate_#{attribute}", self.send(attribute)); mem }
      variant.update_attributes(updated_values) unless updated_values.blank?
    end unless updated_attributes.blank?
  end
  def set_variant_modifiers
    updated_attributes = [:price, :weight, :width, :height, :depth].select { |x| self.send(x).blank? }
    updated_attributes.each do |attribute|
      self.send(:"#{attribute}=", calculate_parameter(attribute))
    end
    true # always return true not to stop processing...
  end

  private
  def calculate_parameter(parameter_name, master_value = nil)
    value = master_value || (product.master.respond_to?(parameter_name) && product.master.send(parameter_name))
    value = value ? value.to_f : 0.0
    value += self.option_values.map{|ov| ov.send(parameter_name).to_f}.sum
    value > 0 ? value : 0
  end
end