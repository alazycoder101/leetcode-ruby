# Given a linked list, remove the nth node from the end of list and return its head.
# For example,
#    Given linked list: 1->2->3->4->5, and n = 2.
#    After removing the second node from the end, the linked list becomes 1->2->3->5.
# Note:
# Given n will always be valid.
# Try to do this in one pass.
# # Definition for singly-linked list.
# class ListNode {
#   int val;
#   ListNode next;
#   ListNode(int x) {
#     val = x;
#     next = null;
#   }
# }
require './list_node'
def remove_nth(list, n)
  l = 0
  node = list
  while l < n
    l += 1
    node = node.next
  end
  head = list
  while node.next.nil?
    head = head.next
    node = node.next
  end
end

# recursive

def remove_nth2(list, n)
end

# last node
list = ListNode.new(10)
list = ListNode.new(9, list)
list = ListNode.new(9, list)
list = ListNode.new(9, list)
list = ListNode.new(9, list)

remove_nth2(list, 1)
puts 'a'
