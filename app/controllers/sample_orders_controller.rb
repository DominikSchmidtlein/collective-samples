class SampleOrdersController < ApplicationController
  def create
    vendor_session = ShopifyApp::SessionRepository.retrieve(params[:vendor_id])
    ShopifyAPI::Base.activate_session(vendor_session)

    order = Order.find(params[:shopify_order_id])
    order.attributes = order.attributes.merge({'note': Time.now.getutc.to_s })
    order.save!
    redirect_to app_proxy_root_path
  end

  def edit
    @sample_order = SampleOrder.find(params[:id])
    @samples = []

    shop = @sample_order.shop
    shop.supplier_partnerships.each do |partnership|
      supplier_id = partnership.supplier_id
      supplier_session = ShopifyApp::SessionRepository.retrieve(supplier_id)
      ShopifyAPI::Base.activate_session(supplier_session)

      @samples += partnership.samples.map do |sample|
        product = ShopifyAPI::Product.find(sample.shopify_product_id)
        {
          id: sample.id,
          title: product.title,
          img_src: product.image.src
        }
      end
    end
  end

  def update
    @sample_order = SampleOrder.find(params[:id])
    if @sample_order.update!(sample_order_params)
      redirect_to edit_sample_order_path(@sample_order)
    else
      render status: 500
    end
  end

  private

  def sample_order_params
    params.require(:sample_order).permit(sample_ids: [])
  end
end
