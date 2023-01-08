# You are given an n x n 2D matrix representing an image.
# Rotate the image by 90 degrees (clockwise).
# Follow up:
# Could you do this in-place?
def rotate(matrix)
  n = matrix.size
  return if n <= 1

  0.upto((n-1)/2).each do |i|
    0.upto(n/2-1).each do |j|
      temp = matrix[i][j]
      matrix[i][j] = matrix[n-j-1][i]
      matrix[n-j-1][i] = matrix[n-i-1][n-j-1]
      matrix[n-i-1][n-j-1] = matrix[j][n-i-1]
      matrix[j][n-i-1] = temp
    end
  end
  matrix
end

m = [[[1,1], [1,2], [1,3]],
     [[2,1], [2,2], [2,3]],
     [[3,1], [3,2], [3,3]],
    ]
puts rotate(m).inspect
n = [[[3,1], [2,1], [1,1]],
     [[3,2], [2,2], [1,2]],
     [[3,3], [2,3], [1,3]]
    ]
