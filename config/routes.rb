Rails.application.routes.draw do
  match '/admin/products/:product_id/variants/regenerate' => 'admin/variants#regenerate', :via => :post, :as => :admin_product_variants_regenerate
  match '/admin/products/:product_id/variants/inline_update' => 'admin/variants#inline_update', :via => :put, :as => :admin_product_variants_inline_update
end
