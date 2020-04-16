arr = [0, 1]

index = 2

while arr[index-1] < 100 do
    fn = arr[index - 1].to_i + arr[index - 2].to_i
    if fn < 100
        arr << fn
        index += 1
    else break
    end

end

puts arr.to_s
