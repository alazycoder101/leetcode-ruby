# There are N gas stations along a circular route, where the amount of gas at station i is gas[i].
# You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from
# station i to its next station (i+1). You begin the journey with an empty tank at one of the gas stations.
# Return the starting gas station's index if you can travel around the circuit once, otherwise return -1.
# Note:
# The solution is guaranteed to be unique.!
#
def gas_station(gases, costs)
  0.upto(gases.size - 1).each do |i|
    gas = 0
    j = i
    gas += gases[i]
    while gas > costs[j]
      gas -= costs[j]
      j += 1
    end
  end
end
