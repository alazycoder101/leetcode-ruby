# Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target?
# Find all unique quadruplets in the array which gives the sum of target.
# Note:
# Elements in a quadruplet (a,b,c,d) must be in non-descending order. (ie, a ≤ b ≤ c ≤ d)
# The solution set must not contain duplicate quadruplets.
#     For example, given array S = {1 0 -1 0 -2 2}, and target = 0.
#     A solution set is:
#     (-1,  0, 0, 1)
#     (-2, -1, 1, 2)
#     (-2,  0, 0, 2)

def fourSum(num, target)
  num.sort!
  hash = {}
  start = 0
  e = num.size
  res = []

  0.upto(num.size-1).each do |i| # first number
    (i+1).upto(num.size -1) do |j| # second number
      k = j + 1 # third number
      l = num.size -1 # 4th number
      while k < l do
        sum = num[i] + num[j] + num[k] + num[l]
        if sum > target
          l -= 1
        elsif sum < target
          k += 1
        else
          temp = [num[i], num[j], num[k], num[l]]
          unless hash.include?(temp) # unique
            hash << temp
            result << temp
          end
          k += 1
          l -= 1
        end
      end
    end
  end
  res
end

puts fourSum([1, 0, -1, 0, -2, 2], 0).inspect
