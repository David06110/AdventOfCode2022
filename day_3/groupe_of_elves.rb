require 'csv'

rucksacks = []
CSV.foreach('rucksacks.csv') do |row|
  rucksacks << row.first.split(//).uniq
end

p rucksacks

groups = []
group = []
n = 0
rucksacks.each do |rucksack|
  group << rucksack
  n += 1
  if n == 3
    # p ' '
    # p 'one group added'
    groups << group
    group = []
    n = 0
  end
end

stickers = []
groups.each do |team|
  sticker = (team.first.select { |k| team[1].include?(k) }).select { |k| team.last.include?(k) }
  stickers << sticker
end

p ' '
p stickers
# p 'all groups'
# p groups

p priorities = [*'a'..'z', *'A'..'Z']
p 'Part two'
p result = []
p priorities.index('d')
p stickers.flatten.map { |com| priorities.index(com) + 1 }.sum
