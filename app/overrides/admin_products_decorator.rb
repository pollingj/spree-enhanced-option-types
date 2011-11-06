Deface::Override.new(
  :virtual_path => "admin/product_scopes/_form",
  :name => "enhanced_option_types_admin_product_form_right",
  :insert_after => "[data-hook='admin_product_form_right'], #admin_product_form_right[data-hook]",
  :partial => "admin/products/extra_master_values_form",
  :disabled => false
)

Deface::Override.new(
  :virtual_path => "admin/products/_new",
  :name => "enhanced_option_types_admin_products_new",
  :insert_bottom => "[data-hook='new_product_attrs']",
  :partial => "admin/products/create_variants_checkbox",
  :disabled => false
)

Deface::Override.new(
  :virtual_path => "admin/products/_new",
  :name => "enhanced_option_types_admin_products_new",
  :insert_before => ".left p:last-child",
  :partial => "admin/products/extra_new_left",
  :disabled => false
)

Deface::Override.new(
  :virtual_path => "admin/products/_new",
  :name => "enhanced_option_types_admin_products_new",
  :insert_before => ".right p:last-child",
  :partial => "admin/products/extra_new_right",
  :disabled => false
)