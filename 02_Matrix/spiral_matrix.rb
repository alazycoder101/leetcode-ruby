# Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
# For example,
# Given the following matrix:
# [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]
# You should return [1,2,3,6,9,8,7,4,5].

def spiralOrder(matrix)
  result = []
  return result if matrix.nil? || matrix.size.zero?

  m = matrix.size
  n = matrix[0].size

  x = 0
  y = 0
  directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  direction = directions[0]

  corner = [n-1, m-1, 0, 0]
  d = 0
  while corner[0] > corner[2] && corner[1] > corner[3]
    result << matrix[x][y]
    if !direction[1].zero? && y == corner[d%4]
      d = (d + 1)
      direction = directions[d%4]
      case d % 4
      when 0
        corner[1] -= 1
      when 3
        corner[0] -= 1
      end
    elsif !direction[0].zero? && x == corner[d%4]
      d = (d + 1)
      direction = directions[d%4]
      case d % 4
      when 1
        corner[2] += 1
      when 2
        corner[3] += 1
      end
    end

    puts "d=#{d} x= #{x} y=#{y}"
    puts corner.inspect
    x += direction[0]
    y += direction[1]
  end
  result
end

matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

puts spiralOrder(matrix).inspect
