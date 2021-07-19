#Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? 
#Find all unique quadruplets in the array which gives the sum of target.
#Note:
#Elements in a quadruplet (a,b,c,d) must be in non-descending order. (ie, a ≤ b ≤ c ≤ d)
#The solution set must not contain duplicate quadruplets.
#    For example, given array S = {1 0 -1 0 -2 2}, and target = 0.
#    A solution set is:
#    (-1,  0, 0, 1)
#    (-2, -1, 1, 2)
#    (-2,  0, 0, 2)

def fourSum(s, target)
  s.sort!
  start = 0
  e = s.size
  res = []
  return res if s.size < 4 || s[0..3].sum > target
  i, j, k, h = 0, 0, 0, s.size - 1
  sum = 0
  while i < h
    while (s[i] + s[h] > target)
      h -= 1
    end
    sum += s[i] + s[h]
    j = i + 1
    while (sum + s[j] > target)
      h -= 1
    end
    sum = s[i] + s[h]
    while j < h && sum + s[j] <= target
      sum = s[i] + s[h] + s[j]
      k = j + 1
      while k < h && sum + s[k] < target
        k += 1
      end
      while sum + s[k] == target
        res << [s[i], s[j], s[k], s[h]]
        k += 1
      end
      j += 1
    end
    i += 1
    sum = 0
  end
  res
end
puts fourSum([1, 0, -1, 0, -2, 2], 0).inspect
