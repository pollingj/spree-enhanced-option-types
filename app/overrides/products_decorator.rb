Deface::Override.new(
  :virtual_path => "products/_cart_form",
  :name => "enhanced_option_types_products_variants",
  :replace => "#product-variants",
  :partial => 'products/selects',
  :disabled => false
)