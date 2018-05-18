# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shop1 = Shop.create(shopify_domain: 'shop1.com', shopify_token: 'abc')
shop2 = Shop.create(shopify_domain: 'shop2.com', shopify_token: 'def')
shop1.vendor_partnerships.create(vendor_shop: shop2)
