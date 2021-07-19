# Given an array of integers, find two numbers such that they add up to a specific target number.
# The function twoSum should return indices of the two numbers such that they add up to the target, 
# where index1 must be less than index2. Please note that your returned answers 
# (both index1 and index2) are not zero-based.
# You may assume that each input would have exactly one solution.

def twoSum(arr, target)
  nums = {}
  indexes = []
  arr.each_with_index do |val, index|
    nums[val] = index
    diff = target - val
    if nums.key?(diff)
      return [nums[diff], index]
    end
  end
  []
end

puts twoSum([1,2,3,4,5], 7).inspect
