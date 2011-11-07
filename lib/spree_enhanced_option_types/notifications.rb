ActiveSupport::Notifications.subscribe "spree.cart.add" do |name, start, finish, id, payload|
  order = payload[:order]
  params = payload[:params] || {}
  params[:option_values].each_pair do |product_id, otov|
    if !params[:quantity].is_a?(Array)
      quantity = params[:quantity].to_i
    else
      quantity = params[:quantity][variant_id].to_i
    end
    option_value_ids = otov.map{|option_type_id, option_value_id| option_value_id}
    variant = Variant.by_option_value_ids(option_value_ids, product_id).first
    order.add_variant(variant, quantity) if quantity > 0
  end if params[:option_values]
end
