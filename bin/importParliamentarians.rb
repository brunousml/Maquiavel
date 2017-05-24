require_relative '../lib/parliamentarians/extract/extractor'
require_relative '../lib/settings'

puts "Started crawl parliamentarians"

parliamentarians = Parliamentarians::Extractor.new(ENV)
data = parliamentarians.dump

puts data if ENV == 'development'

puts "Data Imported"