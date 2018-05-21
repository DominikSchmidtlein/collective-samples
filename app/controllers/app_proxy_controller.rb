class AppProxyController < ApplicationController
  include ShopifyApp::AppProxyVerification

  def index
    @shops = Shop.all
    @products = []

    shop = Shop.find_by(shopify_domain: params[:shop])
    shop.supplier_partnerships.each do |partnership|
      supplier_shop_id = partnership.supplier_shop_id
      supplier_session = ShopifyApp::SessionRepository.retrieve(supplier_shop_id)
      ShopifyAPI::Base.activate_session(supplier_session)

      @products += partnership.samples.map do |sample|
        ShopifyAPI::Product.find(sample.shopify_product_id)
      end
    end

    render layout: false, content_type: 'application/liquid'
  end

end
