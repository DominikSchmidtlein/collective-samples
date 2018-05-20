# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

supplier = Shop.create(shopify_domain: 'supplier.com', shopify_token: 'abc')
vendor = Shop.create(shopify_domain: 'vendor.com', shopify_token: 'def')

partnership = supplier.vendor_partnerships.create(vendor_shop: vendor)

partnership.samples.create(shopify_product_id: 123456789)
partnership.samples.create(shopify_product_id: 987654321)
