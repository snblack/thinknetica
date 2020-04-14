puts "Привет. Я считаю площадь треугольника"

puts "\nКакой длины основание?"
length = STDIN.gets.chomp.to_f

puts "Высота треугольника?"
height = STDIN.gets.chomp.to_f

square_delta = 1.0 /2.0 * length * height

puts "Площадь треугольника:"
puts square_delta
