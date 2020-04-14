puts 'Введите коэффициент А'
a = gets.chomp.to_f

puts 'Введите коэффициент B'
b = gets.chomp.to_f

puts 'Введите коэффициент C'
c = gets.chomp.to_f

d = b**2 - 4*a*c

if d > 0
  x1 = (-b + Math.sqrt(d))/(2*a)
  x2 = (-b - Math.sqrt(d))/(2*a)
  puts "Дискриминант = #{d}"
  puts "Корень X1 = #{x1}"
  puts "Корень X2 = #{x2}"

elsif d == 0
  x1 = x2 = -b/(2*a)
  puts "Дискриминант = #{d}"
  puts "Корень X1 = #{x1}"
  puts "Корень X2 = #{x2}"

elsif d < 0
  puts "Дискриминант = #{d}"
  pust 'корней нет'
end
