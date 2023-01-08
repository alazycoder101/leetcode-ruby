# Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in place.
# Follow up:
# Did you use extra space?
# A straight forward solution using O(mn) space is probably a bad idea.
# A simple improvement uses O(m + n) space, but still not the best solution.
# Could you devise a constant space solution?
#
def setZeroes(matrix)
  # m x n
  m = matrix.size
  n = matrix[0].size
  return if m.zero? || n.zero?
  return if m == 1 && n == 1

  row = col = false

  # first row and first column
  0.upto(n - 1).each do |i|
    if matrix[0][i].zero?
      row = true
      break
    end
  end

  0.upto(n - 1).each do |i|
    if matrix[i][0].zero?
      col = true
      break
    end
  end

  # set a lable in first row and column
  0.upto(m - 1).each do |i|
    0.upto(n - 1).each do |j|
      if matrix[i][j].zero?
        matrix[0][j] = 0
        matrix[i][0] = 0
      end
    end
  end

  0.upto(m - 1).each do |i|
    0.upto(n - 1).each do |j|
      if matrix[0][j].zero? || matrix[i][0].zero?
        matrix[i][j] = 0
      end
    end
  end

  # set first row and column
  if row
    0.upto(n - 1).each do |j|
      matrix[0][j] = 0
    end
  end

  if col
    0.upto(m - 1).each do |i|
      matrix[i][0] = 0
    end
  end
end
