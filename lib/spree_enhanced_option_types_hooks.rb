class SpreeEnhancedOptionTypesHooks < Spree::ThemeSupport::HookListener
  Deface::Override.new(:virtual_path => "admin/product_scopes/_form",
                       :name => "enhanced_option_types_admin_product_form_right",
                       :insert_after => "[data-hook='admin_product_form_right'], #admin_product_form_right[data-hook]",
                       :partial => "admin/products/extra_master_values_form",
                       :disabled => false)

  Deface::Override.new(:virtual_path => "layouts/admin",
                       :name => "enhanced_option_types_admin_inside_head",
                       :insert_after => "[data-hook='admin_inside_head'], #admin_inside_head[data-hook]",
                       :partial => "admin/shared/jeditable",
                       :disabled => false)


  # insert_after :admin_product_form_right, :partial => 'admin/products/extra_master_values_form'
  # insert_after :admin_inside_head, :partial => 'admin/shared/jeditable'
end
