#Given an array S of n integers, find any number of integers in S such that the sum is closest to a given number, target. 
#Return the sum of the three integers. You may assume that each input would have exactly one solution.
#
#    For example, given array S = {1 2 3 4}, and target = 9.
#    The sum that is closest to the target is 9. (2 + 3 + 4 = 9).
def anySum(nums, target)
  return 0 if nums.size == 0
  return nums.first if nums.size == 1
  return nums.sum if nums.size == 2
  result = []
  remaining = nums.dup
  nums = nums.sort.reverse
  size = nums.size
  ins = []
  if anySum(ins, target)
    ins.push 
  end
  result
end

nums = [-1, 0, 1, 2, -1, -4]
puts threeSum(nums).inspect
