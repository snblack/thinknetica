arr = [0, 1]

index = 2

while arr[-1] < 100 do
    fn = arr[-1].to_i + arr[-2].to_i
    if fn < 100
        arr << fn
    else break
    end

end

puts arr.to_s
