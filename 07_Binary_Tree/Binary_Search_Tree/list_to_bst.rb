# Given a singly linked list where elements are sorted in ascending order, convert it to a hiehgt balanced BST
require '../tree_node.rb'

def list_to_bst(head)
  convert(head, null)
end

def convert(head, tail)
  return nil if head == tail
  mid = start
  probe = start
  while probe != tail && probe.next != tail
    mid = mid.next
    probe = probe.next.next
  end

  root = TreeNode.new mid.val
  root.left = convert(head, mid)
  root.right = convert(mid.next, tail)
  root
end
