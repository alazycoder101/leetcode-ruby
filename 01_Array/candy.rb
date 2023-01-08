#There are N children standing in a line. Each child is assigned a rating value.
#You are giving candies to these children subjected to the following requirements:
#Each child must have at least one candy.
#Children with a higher rating get more candies than their neighbors.
#What is the minimum candies you must give?

def candy(ratings)
  ratings.sort!
  candy = 0
  old_rate = 0
  sum = 0
  ratings.each do |rate|
    if rate != old_rate
      candy += 1
      old_rate = rate
    end
    sum += candy
  end
  sum
end

puts candy([1,2,3,5,9])
