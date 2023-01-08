# Given an array where elements are sorted in ascending order, convert it to a hiehgt balanced BST.
#
require '../tree_node.rb'
def sorted_array_to_bst(nums)
  return nil if nums.length == 0
  convert(nums, 0, nums.length)
end

def convert(nums, low, high)
  return nil if low == high

  mid = (low + high) / 2
  root = TreeNode.new(nums[mid])
  root.left = convert(nums, low, mid)
  root.right = convert(nums, mid + 1, high)
  root
end

nums = [0, 1, 2, 3, 4, 5, 6, 7]

tree = sorted_array_to_bst(nums)
tree.show
