Rails.application.routes.draw do |map|
  post "/admin/products/:product_id/variants/regenerate", :to => "admin/variants#regenerate"
  put "/admin/products/:product_id/variants/inline_update", :to => "admin/variants#inline_update"
end
