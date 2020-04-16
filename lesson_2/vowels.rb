all_letters = ('а'..'я').to_a
nowels = all_letters.join.scan /а|е|и|о|у|ы|э|ю|я/

num = 1
hash = Hash.new

nowels.each do |nowel|
  hash[nowel] = num
  num += 1
end

puts hash
