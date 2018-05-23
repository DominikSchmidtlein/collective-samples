class AppProxyController < ApplicationController
  include ShopifyApp::AppProxyVerification

  def index
    @sample_order = SampleOrder.find(params.require(:sample_order_id))
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

    render layout: false, content_type: 'application/liquid'
  end

end
