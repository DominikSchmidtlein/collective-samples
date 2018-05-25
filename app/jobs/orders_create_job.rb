class OrdersCreateJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    customer_email = webhook['email']
    shopify_order_id = webhook['id']

    shop.with_shopify_session do
      sample_order = shop.sample_orders.create(status: :pending, shopify_order_id: shopify_order_id)
    end
  end
end
