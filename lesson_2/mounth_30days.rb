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

mounth_with_days.each do |mounth, day|
  puts "#{mounth}: #{day}" if day == 30
end
