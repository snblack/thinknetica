all_letters = ('а'..'я').to_a
nowels = all_letters.join.scan /а|е|и|о|у|ы|э|ю|я/

num = 1
hash = {}

nowels.each_with_index do |nowel, i|
  hash[nowel] = i
end

puts hash
