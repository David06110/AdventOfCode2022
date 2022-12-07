require 'csv'

def split_in_half(rucksack)
  sack = []
  compart = rucksack.length / 2
  sack << rucksack[0, compart] # last not included
  sack << rucksack[compart..]
  # p sack
end

rucksacks = []
CSV.foreach('test.csv') do |row|
  rucksacks << split_in_half(row.first)
end

p rucksacks

double = []
rucksacks.each do |comparts|
  item = 0
  comparts.first.each_char { |c| item = c unless comparts.last == comparts.last.delete(c) }
  double << item # because it could be multiple items in a compartiment
end

p double

priorities = [*'a'..'z', *'A'..'Z']
p 'Part one'
p (double.map { |d| priorities.index(d) + 1 }).sum
