def brute_force(bars, distances)
  combinations = bars.to_a.permutation.to_a
  record_distance = calculate_distance(bars, distances)
  best_combination = bars

  combinations.each do |comb|
    dist = calculate_distance(comb, distances)
    if dist < record_distance
      record_distance = dist
      best_combination = comb
    end
  end

  return {comb: best_combination, dist: record_distance }
end

def calculate_distance(bars, distances)
  distance = 0

  bars[0...-1].each_with_index do |bar, ind|
    if distances[bar].nil? || distances[bar][bars[ind + 1]].nil?
      distance += distances[bars[ind + 1]][bar]
    else
      distance += distances[bar][bars[ind + 1]]
    end
  end

  return distance
end

# Testing

# 7.times do |i|
#   puts "Brute force for #{i + 4} bars"
#   bars = []
#   (i + 4).times do |ind|
#     bars << "bar#{ind + 1}".to_sym
#   end
#   distances = {}
#   bars[0...-1].each_with_index do |bar, ind|
#     temp = {}
#     bars[(ind + 1)..].each do |other|
#       temp[other] = (rand(100) + 50)
#     end
#     distances[bar] = temp
#   end
#   puts "Bars: #{bars}"
#   combs = bars.permutation.to_a.length
#   puts "#{combs} possible Combinations..."
#   start = Time.now()
#   puts brute_force(bars, distances)
#   time = Time.now - start
#   puts "Took #{time} seconds"
#   puts "#{combs/time} combinations per second"
#   puts ""
# end
