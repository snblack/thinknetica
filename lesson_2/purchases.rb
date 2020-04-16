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

# На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш,

# ключами которого являются названия товаров, а значением -
# вложенный хеш, содержащий цену за единицу товара и кол-во
# купленного товара.

# Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в
# "корзине".
