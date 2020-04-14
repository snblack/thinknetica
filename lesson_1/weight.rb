puts "Как вас зовут?"
name = STDIN.gets.chomp

puts "Какой у вас рост?"
height = STDIN.gets.chomp.to_f

ideal_weight = (height - 110) * 1.15

if ideal_weight > 0
  puts "#{name}, ваш идеальный вес #{ideal_weight} кг."
else puts "#{name}, ваш вес уже оптимальный!"
end
