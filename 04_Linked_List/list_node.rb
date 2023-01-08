# list node
class ListNode
  attr_accessor :val, :next

  def initialize(val, next_node = nil)
    self.val = val
    self.next = next_node
  end
end
