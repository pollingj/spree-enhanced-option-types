Rails.application.routes.draw do |map|
  match '/admin/products/:product_id/variants/regenerate' => 'admin/variants#regenerate', :via => 'post'
  match '/admin/products/:product_id/variants/inline_update' => 'admin/variants#inline_update', :via => 'put'
end
