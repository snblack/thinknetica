puts 'Число'
day = gets.chomp.to_i

puts 'Месяц'
mounth = gets.chomp.to_i

puts 'Год'
year = gets.chomp.to_i

# hash массив с месяцами и кол-вом дней в обычном году
mounth_with_days = {
  junuary: 31,
  february: 28,
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

# меняем значения февраля, если год высокосный
if year % 400 == 0
  mounth_with_days[:february] = 29
elsif year % 4 == 0 and year % 100 != 0
  mounth_with_days[:february] = 29
end

#считаем кол-во дней за прошедшие месяца в году
# и складываем с числом
days_mounth = mounth_with_days.values.first(mounth - 1).sum
serial_number = days_mounth + day

puts serial_number
