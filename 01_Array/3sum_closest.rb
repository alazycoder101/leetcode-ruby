#Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. 
#Return the sum of the three integers. You may assume that each input would have exactly one solution.
#
#    For example, given array S = {-1 2 1 -4}, and target = 1.
#    The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
def threeSum(nums, target)
  return 0 if nums.size == 0
  return nums.first if nums.size == 1
  return nums.sum if nums.size == 2
  result = []
  nums.sort!
  size = nums.size
  s = e = negate = 0
  (0..size-2).each do |i|
    s = i + 1
    e = size - 1
    while s < e
      sum = nums[i] + nums[s] + nums[e]
      diff = (sum - target).abs

      if diff<min
        min = diff
        result = sum
      end

      if sum<target
        s += 1
      else
        e -= 1
      end
    end
  end
  result
end

nums = [-1, 0, 1, 2, -1, -4]
puts threeSum(nums).inspect
