class SpreeEnhancedOptionTypesHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_product_form_right, :partial => 'admin/products/extra_master_values_form'
  insert_after :admin_inside_head, :partial => 'admin/shared/jeditable'
end
