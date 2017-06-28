require File.expand_path('../../config/environment', __FILE__)
puts "Starting..."
cur1 = Currency.create(abbr: "PLN", description: "polski złoty", is_base: true,  locale: "pl", value_in_base: 1)
cur2 = Currency.create(abbr: "USD", description: "us dollar",    is_base: false, locale: "en-US", value_in_base: 3)
puts "Currencies done!"
pr1 = Product.create(currency_id: cur1.id, price: 50, description: "A")
pr2 = Product.create(currency_id: cur1.id, price: 30, description: "B")
pr3 = Product.create(currency_id: cur1.id, price: 20, description: "C")
pr4 = Product.create(currency_id: cur1.id, price: 15, description: "D")
pr5 = Product.create(currency_id: cur2.id, price: 10, description: "E")
pr6 = Product.create(currency_id: cur2.id, price: 10, description: "F")
puts "Products done!"
r = Rule.create(product_id: pr1.id, count: 3, date_from: "2017-06-28", date_to: "2022-06-28", price: 130, currency_id: cur1.id)
r = Rule.create(product_id: pr2.id, count: 2, date_from: "2017-06-28", date_to: "2022-06-28", price: 45, currency_id: cur1.id)
r = Rule.create(product_id: pr5.id, count: 2, date_from: "2017-06-28", date_to: "2022-06-28", price: 12, currency_id: cur2.id)
puts "Rules done!"
cr = CustomRule.create(product_id: pr6.id, rule: "total += 200", date_from: "2017-06-28", date_to: "2022-06-28")
puts "CustomRule done!"
puts 'All systems ready!'
