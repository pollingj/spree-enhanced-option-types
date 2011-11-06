# Deface::Override.new(
#   :virtual_path => "admin/prototypes/_form",
#   :name => "enhanced_option_types_admin_prototypes_options",
#   :replace => "code[erb-silent]:contains('OptionType.all.each')",
#   :partial => "admin/prototypes/ehanced_option_sortable",
#   :disabled => false
# )

# Deface::Override.new(
#   :virtual_path => "admin/prototypes/_form",
#   :name => "enhanced_option_types_admin_prototypes_hint",
#   :insert_after => "#option_types + hr",
#   :text => "(hint: You can drag and drop option types to select their order)",
#   :disabled => false
# )