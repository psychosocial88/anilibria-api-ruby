require 'anilibria/api'

anilibria = Anilibria::Api::Client.new

title = anilibria.get_random_title(remove: 'posters,player,torrents')
# title = anilibria.get_title(id: 495, remove: 'posters,player,torrents')

subtitle_team = title.team.translator + title.team.editing + title.team.decor

puts "#{title.names.ru} / #{title.names.en}"
puts
puts "Сезон: #{title.season.year} #{title.season.string}"
puts "Тип: #{title.type.full_string}"
puts "Жанры: #{title.genres.join(', ')}"
puts "Озвучка: #{title.team.voice.join(', ')}"
puts "Тайминг: #{title.team.timing.join(', ')}" if title.team.timing.any?
puts "Работа над субтитрами: #{subtitle_team.join(', ')}" if subtitle_team.any?
puts
puts title.description
puts
puts format('https://www.anilibria.tv/release/%<code>s.html', code: title.code)
