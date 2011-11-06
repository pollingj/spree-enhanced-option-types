Deface::Override.new(
  :virtual_path => "products/_cart_form",
  :name => "enhanced_option_types_products_variants",
  :replace => "#product-variants",
  :partial => Spree::Config[:eot_presentation_type] || 'radio_sets',
  :disabled => false
)