arr = []

for int in 10..100 do
  arr << int if int % 5 == 0
end

puts arr.to_s
