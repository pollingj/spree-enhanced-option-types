Deface::Override.new(
  :virtual_path => "admin/option_types/edit",
  :name => "enhanced_option_types_admin_option_types_edit",
  :insert_before => "[data-hook='option_header'] th:last-child",
  :partial => "admin/option_types/enhanced_option_headers",
  :disabled => false
)

Deface::Override.new(
  :virtual_path => "admin/option_types/_option_value_fields",
  :name => "enhanced_option_types_admin_option_types_fields",
  :insert_before => "[data-hook='option_value'] td:last-child",
  :partial => "admin/option_types/enhanced_option_values",
  :disabled => false
)
