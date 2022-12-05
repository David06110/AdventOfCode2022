require 'csv'

def shape_score(round)
  round.map do |shape|
    case shape
    when 'A', 'X' # Rock
      1
    when 'B', 'Y' # paper
      2
    when 'C', 'Z' # scissor
      3
    end
  end
end

rounds = []

CSV.foreach('plan.csv') do |row|
  rounds << shape_score(row.first.split)
end

results = []

rounds.each do |hand|
  result = hand.last
  (result += 3) if hand.first == hand.last
  (result += 6) if hand.last == 1 && hand.first == 3
  (result += 6) if hand.last == 2 && hand.first == 1
  (result += 6) if hand.last == 3 && hand.first == 2
  results << result
end
p 'first interpreted'
p results.sum

# ----------------------------------------------------------------
results = []

rounds.each do |hand|
  if hand.last == 1
    result = hand.first - 1
    result = 3 if hand.first == 1
  end
  (result = hand.first + 3) if hand.last == 2
  if hand.last == 3
    result = hand.first + 7
    result = 7 if hand.first == 3
  end
  results << result
end
p 'second interpreted'
p results.sum
