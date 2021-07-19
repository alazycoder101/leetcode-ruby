#Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? 
#Find all unique triplets in the array which gives the sum of zero.
#Note:
#Elements in a triplet (a,b,c) must be in non-descending order. (ie, a ≤ b ≤ c)
#The solution set must not contain duplicate triplets.
#    For example, given array S = {-1 0 1 2 -1 -4},
#    A solution set is:
#    (-1, 0, 1)
#    (-1, -1, 2)
#
def threeSum(nums)
  result = []
  nums.sort!
  size = nums.size
  s = e = negate = 0
  (0..size-2).each do |i|
    puts "s=#{s} e=#{e}"
    if i==0 || nums[i]>nums[i-1]
      negate = -nums[i]
      s = i + 1
      e = size - 1
      while s < e
        if nums[s] + nums[e] == negate
          result << [nums[i], nums[s], nums[e]]
        end
        s += 1
        e -= 1
      end

      while(s < e && nums[e] == nums[e+1])
        e -= 1
      end

      while(s < e && nums[s] == nums[s-1])
        s += 1
      end
    elsif nums[s] + nums[e] < negate
      s += 1
    else
      e -= 1
    end
  end
  result
end

nums = [-1, 0, 1, 2, -1, -4]
puts threeSum(nums).inspect
