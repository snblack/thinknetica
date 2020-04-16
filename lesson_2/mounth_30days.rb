mounth_with_days = {
  junuary: 31,
  febrary: 29,
  mart: 31,
  april: 30,
  may: 31,
  june: 30,
  jule: 31,
  august: 31,
  september: 30,
  october: 31,
  november: 30,
  december: 31
}

mounth_with_days.each do |key, val|
  if val == 30
    puts "#{key}: #{val}"
  end
end
