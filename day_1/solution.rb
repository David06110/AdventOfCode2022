require "csv"

calories = []

CSV.foreach('calories.csv') do |row|
  calories << row.first.to_i
end

calories_formated = []
elve = 0

calories.each do |calorie|
  if calorie.zero?
    calories_formated << elve
    elve = 0
  else
    elve += calorie
  end
end

p 'most carrying calories elves'
p calories_formated.each.max

p 'Sum of calories of 3 most carrying elves '
p calories_formated.each.sort.reverse!.first(3).sum
