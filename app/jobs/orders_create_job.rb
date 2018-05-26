class OrdersCreateJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    sample_order = nil
    shop.with_shopify_session do
      sample_order = shop.sample_orders.create(status: :pending, shopify_order_id: webhook['id'])
    end

    first_name, email = webhook['customer'].values_at('first_name', 'email')
    SamplesMailer.with(
      name: first_name,
      email: email,
      sample_order_id: sample_order.id
    ).sample_form.deliver_now
  end
end
