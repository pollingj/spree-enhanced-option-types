OrdersController.class_eval do
  def populate
    @order = current_order(true)

    params[:products].each do |product_id,variant_id|
      quantity = params[:quantity].to_i if !params[:quantity].is_a?(Hash)
      quantity = params[:quantity][variant_id.to_i].to_i if params[:quantity].is_a?(Hash)
      @order.add_variant(Variant.find(variant_id), quantity) if quantity > 0
    end if params[:products]

    params[:variants].each do |variant_id, quantity|
      quantity = quantity.to_i
      @order.add_variant(Variant.find(variant_id), quantity) if quantity > 0
    end if params[:variants]

    params[:option_values].each_pair do |product_id, otov|
      if !params[:quantity].is_a?(Array)
        quantity = params[:quantity].to_i
      else
        quantity = params[:quantity][variant_id].to_i
      end
      option_value_ids = otov.map{|option_type_id, option_value_id| option_value_id}
      variant = Variant.by_option_value_ids(option_value_ids, product_id).first
      @order.add_variant(variant, quantity) if quantity > 0
    end if params[:option_values]

    fire_event('spree.cart.add')
    fire_event('spree.order.contents_changed')
    respond_with(@order) { |format| format.html { redirect_to cart_path } }
  end
end
