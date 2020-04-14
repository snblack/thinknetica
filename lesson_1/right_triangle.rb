require "byebug"

puts "Первая сторона треугольника?"
side1 = STDIN.gets.chomp.to_f

puts "Вторая сторона треугольника?"
side2 = STDIN.gets.chomp.to_f

puts "Третья сторона треугольника?"
side3 = STDIN.gets.chomp.to_f

sids = [side1,side2,side3]
sids_sort = sids.sort.reverse

# byebug

if sids[0] == sids[1] and sids[0] == sids[2]
  puts "Треугольник равностороний и равнобедренный"
elsif sids_sort[0]**2 == sids_sort[1]**2 + sids_sort[2]**2
    puts "Треугольник прямоугольный"
    if sids.uniq.size < 3
      puts "Треугольник равностороний"
    end
elsif sids.uniq.size < 3
  puts "Треугольник равностороний"
else puts "Треугольник разносторонний"
end
