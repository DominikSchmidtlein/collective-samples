ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = ENV['SHOPIFY_CLIENT_API_KEY']
  config.secret = ENV['SHOPIFY_CLIENT_API_SECRET']
  config.scope = "read_orders, read_products, write_orders"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
  config.webhooks = [
    {topic: 'orders/create', address: 'https://cryptic-shore-31839.herokuapp.com/webhooks/orders_create', format: 'json'},
  ]
end
