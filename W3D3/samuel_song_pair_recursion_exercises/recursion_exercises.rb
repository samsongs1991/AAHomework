require "byebug"

# 1 -----------------------------------------------------------
def exp(b, n)
  return 1 if n == 0
  b * exp(b, n - 1)
end

def even_odd_exp(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    expo = even_odd_exp(b, n/2)
    expo * expo
  else
    b * expo * expo
  end
end

# 2 -----------------------------------------------------------
def deep_dup(array)
    new_arr = []

    array.each do |el|
        if !el.is_a?(Array)
            new_arr << el
        else
            new_arr << deep_dup(el)
        end
    end

    new_arr
end

# 3 -----------------------------------------------------------
def iterative_fib(n)
  return [] if n <= 0
  return [0] if n == 1

  fibs = [0, 1]
  i = 0
  while i < (n - 2)
    fibs << fibs[i] + fibs[i + 1]
    i += 1
  end
  return fibs
end

def recursive_fib(n)
  return [] if n <= 0
  return [0] if n == 1
  return [0, 1] if n == 2
  return [0, 1, 1] if n == 3
  fibs = recursive_fib(n-1)
  fibs << fibs[-1] + fibs[-2]
end

 #4 -----------------------------------------------------------
 def bsearch(array, target)
    mid = array.length / 2
    target_idx = mid

    if array[mid] == target
        return mid
    elsif array.length == 1
        return nil
    elsif array[mid] > target
        target_idx = bsearch(array[0...mid], target)
    elsif array[mid] < target
        upper = bsearch(array[mid+1..-1], target)
        if upper == nil
          return nil
        else
          target_idx += 1 + upper
        end
    end

    target_idx
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
p bsearch(arr, 10)

# 5 -----------------------------------------------------------
def merge_sort(array)
  return array if array.length == 0 || array.length == 1
  mid = array.length / 2
  arr_1 = merge_sort(array[0...mid])
  arr_2 = merge_sort(array[mid..-1])
  merge(arr_1, arr_2)
end

def merge(arr_1, arr_2)
  combined_arr = []
  num = arr_1.length + arr_2.length

  num.times do
    if arr_1.empty?
      combined_arr << arr_2.shift
    elsif arr_2.empty?
      combined_arr << arr_1.shift
    elsif arr_1[0] < arr_2[0]
      combined_arr << arr_1.shift
    else
      combined_arr << arr_2.shift
    end
  end

  combined_arr
end

# 6 -----------------------------------------------------------
def subsets(arr)
  debugger
  return [[]] if arr.empty?

  old_subsets = subsets(arr[1..-1])
  new_subsets = []
  old_subsets.each do |subset|
    new_subsets << subset + [arr.first]
  end
  old_subsets + new_subsets

end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# 7 ----------------------------------------------------------
