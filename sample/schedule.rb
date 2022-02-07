require 'anilibria/api'

WEEK_DAYS = %w[
  Понедельник
  Вторник
  Среда
  Четверг
  Пятница
  Суббота
  Воскресенье
].freeze

anilibria = Anilibria::Api::Client.new

schedules = anilibria.get_schedule(filter: 'names.ru')

schedules.each do |schedule|
  puts "#{WEEK_DAYS[schedule.day]}:"

  schedule.list.each do |title|
    puts "  #{title.names.ru}"
  end

  puts
end
