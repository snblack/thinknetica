arr = []

for int in 10..100 do
  if int % 5 == 0
    arr << int
  end
end

puts arr.to_s
