class AppProxyController < ApplicationController
   include ShopifyApp::AppProxyVerification

  def index
    @shops = Shop.all
    shop = Shop.find_by(shopify_domain: params[:shop])
    shop = ShopifyApp::SessionRepository.retrieve(shop.id)
    ShopifyAPI::Base.activate_session(shop)
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })

    shop = Shop.find_by(shopify_domain: 'sharetest052018.myshopify.com')
    shop = ShopifyApp::SessionRepository.retrieve(shop.id)
    ShopifyAPI::Base.activate_session(shop)
    @products += ShopifyAPI::Product.find(:all, params: { limit: 10 })

    render layout: false, content_type: 'application/liquid'
  end

end
