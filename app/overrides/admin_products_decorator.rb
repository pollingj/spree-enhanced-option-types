Deface::Override.new(
  :virtual_path => "admin/products/_form",
  :name => "enhanced_option_types_admin_product_form_right",
  :insert_bottom => "[data-hook='admin_product_form_right']",
  :partial => "admin/products/extra_master_values_form",
  :disabled => false
)
