class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    self.val = val
  end

  def show
    left.show unless left.nil?
    puts val
    right.show unless right.nil?
  end
end
