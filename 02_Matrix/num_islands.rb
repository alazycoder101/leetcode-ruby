# Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.
#
# An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
#
#
#
# Example 1:
#
# Input: grid = [
#   ["1","1","1","1","0"],
#   ["1","1","0","1","0"],
#   ["1","1","0","0","0"],
#   ["0","0","0","0","0"]
# ]
# Output: 1
# Example 2:
#
# Input: grid = [
#   ["1","1","0","0","0"],
#   ["1","1","0","0","0"],
#   ["0","0","1","0","0"],
#   ["0","0","0","1","1"]
# ]
# Output: 3
#
#
# Constraints:
#
# m == grid.length
# n == grid[i].length
# 1 <= m, n <= 300
# grid[i][j] is '0' or '1'.
# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
    m = grid.size
    n = grid[0].size
    no = 0
    0.upto(m - 1).each do |i|
        0.upto(n - 1).each do |j|
            if grid[i][j] === "1"
                no += 1
                grid[i][j] = no
            end

            if grid[i][j].to_i > 0
            if j < n - 1 && grid[i][j+1] === "1"
                grid[i][j+1] = no
            end
            if i < m -1 && grid[i+1][j] === '1'
                grid[i+1][j] = no
            end
            end
        end
    end
    no
end

grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
puts num_islands(grid)
grid = [
  ["0","1","1","1","0"],
  ["0","0","0","1","0"],
  ["0","1","1","1","0"],
  ["0","0","0","0","0"]
]
puts num_islands(grid)

