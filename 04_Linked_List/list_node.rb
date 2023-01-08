# list node
class ListNode
  attr_accessor :val, :next

  def initialize(val, next_node = nil)
    self.val = val
    self.next = next_node
  end
end

def list_len(list)
  return 0 if list.nil
  list_len(list.next) + 1
end

def print_list(list)
  return if list.nil?
  print list.val
  while !list.next.nil?
    print "->#{list.val}"
  end
end

