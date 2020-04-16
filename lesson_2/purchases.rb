hash = Hash.new('Корзина пустая')

loop do
puts 'Название товара?'
title = gets.chomp
break if title == 'стоп'

puts 'Цена за единицу?'
price = gets.chomp.to_f

puts 'Кол-во купленного товара?'
quantity = gets.chomp.to_f

hash[title] = {
  price: price,
  quantity: quantity
}
end

common = []

puts "\n"

hash.each do |key, val|
  puts "#{key}: #{val[:price] * val[:quantity]}"
  common << val[:price] * val[:quantity]
end

puts "Сумма: #{common.sum}"
