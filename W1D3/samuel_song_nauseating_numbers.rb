# 1 -----------------------------------------
def strange_sums(nums)
    count = 0
    (0...nums.length - 1).each do |i|
        (i + 1..nums.length - 1).each do|j|
            count += 1 if nums[i] + nums[j] == 0
        end
    end
    count
end

# 2 -----------------------------------------
def pair_product(nums, product)
    (0...nums.length - 1).each do |i|
        (i + 1..nums.length - 1).each do|j|
            return true if nums[i] * nums[j] == product
        end
    end
    false
end

# 3 -----------------------------------------
def rampant_repeats(str, hash)
    new_str = ''
    str.each_char { |char| hash.include?(char) ? new_str += char * hash[char] : new_str += char }
    new_str
end

# 4 -----------------------------------------
def perfect_square(num)
    return true if num == 1
    (2..num / 2).each { |sq| return true if sq * sq == num }
    false
end

# 5 -----------------------------------------
def anti_prime?(num)
    count = count_divisors(num)
    (1...num).each { |test_agnst| return false if count < count_divisors(test_agnst) }
    true
end

def count_divisors(num)
    count = 0
    (1..num).each { |divisor| count += 1 if num % divisor == 0 }
    count
end

# 6 -----------------------------------------
def matrix_addition(matrix_1, matrix_2)
    matrix_sum = []
    # sub = 0
    # while sub < matrix_1.length
    #   el = 0
    #   temp = []
    #   while el < matrix_1[sub].length
    #     temp << matrix_1[sub][el] + matrix_2[sub][el]
    #     el += 1
    #   end
    #   matrix_sum << temp
    #   sub += 1
    # end
    (0..matrix_1.length - 1).each do |sub|
        temp = []
        (0..matrix_1[sub].length - 1).each do |el|
            temp << matrix_1[sub][el] + matrix_2[sub][el]
        end
        matrix_sum << temp
    end
    matrix_sum
  end

# 7 -----------------------------------------
def mutual_factors(*nums)
    fac_arr = []
    nums.each { |num| fac_arr << factors(num) }
    fac_arr.inject { |acc, el| common_nums(acc, el) }
end

def factors(num)
    arr = []
    (1..num).each { |divisor| arr << divisor if num % divisor == 0 }
    arr
end

def common_nums(nums_1, nums_2)
    common = []
    nums_1.each { |num| common << num if nums_2.include?(num) }
    common
end

# 8 -----------------------------------------
def tribonacci_number(n)
    return 1 if n == 1 || n == 2
    return 2 if n == 3
    trib = [1, 1, 2]
    (3..n - 1).each { |i| trib << trib[i - 3, 3].sum }
    trib[-1]
end

# 9 -----------------------------------------
def matrix_addition_reloaded(*matrices)
    (0...matrices.length - 1).each { |i| return nil if !same_height_width?(matrices[i], matrices[i+1]) }
    matrices.inject { |acc, el| matrix_addition(acc, el) }
end

def same_height_width?(matrix_1, matrix_2)
    matrix_1.length == matrix_2.length && matrix_1[0].length == matrix_2[0].length ? true : false
end

# 10 ----------------------------------------
def squarocol?(arrs)
    return true if any_row_same?(arrs)
    return true if any_row_same?(arrs.transpose)
    false
end

def any_row_same?(arrs)
    (0..arrs.length - 1).each do |i|
      return true if arrs[i].all? { |el| el == arrs[i][0] }
    end
    false
end

# 11 ----------------------------------------
def squaragonal?(matrix)
    diag_1 = true
    diag_2 = true
    (0...matrix.length - 1).each { |i| diag_1 = false if matrix[i][i] != matrix[i + 1][i + 1] }
    (0...matrix.length - 1).each { |i| diag_2 = false if matrix[i][(matrix.length - 1) - i] != matrix[i + 1][((matrix.length - 1) - i) - 1] }
    diag_1 || diag_2
end

# 12 ----------------------------------------
def pascals_triangle(n)
    return [] if n == 0
    triangle = [[1]]
    until triangle.length == n
      triangle << new_layer(triangle[-1])
    end
    triangle
  end

def new_layer(arr)
    new_arr = []
    (0..arr.length).each { |i| i == 0 || i == arr.length ? new_arr << 1 : new_arr << arr[i - 1] + arr[i] }
    new_arr
end

# 13 ----------------------------------------
def mersenne_prime(n)
    m_primes =[]
    i = 0
    until m_primes.length == n
      m_primes << i if mersenne_prime?(i) && is_prime?(i)
      i += 1
    end
    m_primes[-1]
end

def mersenne_prime?(num)
    i = 0
    while num >= 2.pow(i) - 1
      return true if num == 2.pow(i) - 1
      i += 1
    end
    false
end

def is_prime?(num)
    return false if num < 2
    (2...num).each { |divisor| return false if num % divisor == 0 }
    true
end

# 14 ----------------------------------------
def triangular_word?(word)
    triangular_num?(word_sum(word))
end

def triangular_num?(num)
    i = 1
    while (i * (i + 1)) / 2 <= num
      return true if (i * (i + 1)) / 2 == num
      i += 1
    end
    false
end

def word_sum(word)
    alpha = ('a'..'z')
    sum = 0
    word.each_char { |char| sum += alpha.find_index(char) + 1 }
    sum
end

# 15 ----------------------------------------
def consecutive_collapse(nums)
    collapsed = false
    until collapsed
      collapsed = true
      i = 0
      while i < nums.length - 1
        if nums[i] == nums[i + 1] + 1 || nums[i] == nums[i + 1] - 1
          nums[i] = nil
          nums[i + 1] = nil
          collapsed = false
          i += 1
        end
        i += 1
      end
      nums.compact!
    end
    nums
end

# 16 ----------------------------------------
def pretentious_primes(arr, n)
    p_primes = []
    arr.each { |num| p_primes << next_pret_prime(num, n) }
    p_primes
end

def next_pret_prime(num, n)
    counter = 0
    prime = nil
    n > 0 ? possible_prime = num + 1 : possible_prime = num - 1
        while counter < n.abs
            return nil if possible_prime < 2
            if is_prime?(possible_prime)
                prime = possible_prime
                counter += 1
            end
            n > 0 ? possible_prime += 1 : possible_prime -= 1
        end
    return prime
end

def is_prime?(num)
    return false if num < 2
    (2...num).each { |divisor| return false if num % divisor == 0 }
    true
end
