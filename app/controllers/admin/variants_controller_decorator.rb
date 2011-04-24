Admin::VariantsController.class_eval do
  def regenerate
    product = Product.find_by_permalink(params[:product_id])
    product.variants.delete_all
    product.do_create_variants(:recreate)
    redirect_to :action => :index, :product_id => params[:product_id]
  end

  def inline_update
    model_klass = params[:model].classify.constantize
    @resource = model_klass.find(params[:id])
    @resource.update_attribute(params[:column].intern, params[:value])
    respond_to do |format|
      format.js  { render :text => @resource.send(params[:column]) }
    end
  end
end