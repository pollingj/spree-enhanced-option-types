Deface::Override.new(
  :virtual_path => "admin/product_scopes/_form",
  :name => "enhanced_option_types_admin_product_form_right",
  :insert_after => "[data-hook='admin_product_form_right'], #admin_product_form_right[data-hook]",
  :partial => "admin/products/extra_master_values_form",
  :disabled => false
)
