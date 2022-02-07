require 'anilibria/api'

anilibria = Anilibria::Api::Client.new

limit = 10

puts 'Введите поисковый запрос:'
input = $stdin.gets.chomp
puts

titles = anilibria.search_titles(
  search: input,
  filter: 'id,names,season,type,team,genres[0]',
  limit: limit
)

puts 'Результаты:'
puts

titles.each do |title|
  puts "  id: #{title.id}"
  puts "  #{title.names.ru} / #{title.names.en}"
  puts "  Сезон: #{title.season.string} #{title.season.year}"
  puts "  Тип: #{title.type.full_string}"
  puts "  Жанр: #{title.genres.join(', ')}"
  puts
end

puts "Всего найдено #{titles.size}, лимит: #{limit}"
