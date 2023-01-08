# Given a linked list, remove the nth node from the end of list and return its head.
# For example,
#    Given linked list: 1->2->3->4->5, and n = 2.
#    After removing the second node from the end, the linked list becomes 1->2->3->5.
# Note:
# Given n will always be valid.
# Try to do this in one pass.
#
# Definition for singly-linked list.
# class ListNode {
#   int val;
#   ListNode next;
#   ListNode(int x) {
#     val = x;
#     next = null;
#   }
# }
require './list_node'
def remove_nth_node_from_end_of_list(list, n)
  len = 1
  node = list
  until node.next.nil?
    len += 1
    node = node.next
  end
  to_remove = len - n
  return list.next if to_remove == 0

  node = node.next while to_remove > 0
  node.next = node.next.next
  list
end
