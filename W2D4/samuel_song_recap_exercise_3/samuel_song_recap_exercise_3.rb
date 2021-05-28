# 1 ---------------------------------------------------
def no_dupes?(arr)
    new_arr = []
    hash = Hash.new(0)
    arr.each { |el| hash[el] += 1 }
    hash.each { |k, v| new_arr << k if v == 1 }
    new_arr
end

# 2 ---------------------------------------------------
def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each { |i| return false if arr[i] == arr[i + 1] }
    true
end

# 3 ---------------------------------------------------
def char_indices(str)
    hash = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index { |c, i| hash[c] << i }
    hash
end

# 4 ---------------------------------------------------
def longest_streak(str)
    long = ''

    temp = ''
    (0..str.length - 1).each { |i|
        char_1 = str[i]
        char_2 = str[i + 1]
        if char_1 == char_2
            temp += char_1
        else
            temp += char_1
            long = temp if temp.length >= long.length
            temp = ''
        end
    }

    long
end

# 5 ---------------------------------------------------
def bi_prime?(num)
    factors(num).each { |pair| return true if is_prime?(pair[0]) && is_prime?(pair[1]) }
    false
end

def factors(num)
    arr = []
    i = 1
    while i <= num
        j = i
        while j <= num
            arr << [i, j] if i * j == num
            j += 1
        end
        i += 1
    end
    arr
end

def is_prime?(num)
    return false if num < 2
    (2...num).each { |divisor| return false if num % divisor == 0 }
    true
end

# 6 ---------------------------------------------------
def vigenere_cipher(message, keys)
    new_str = ''
    alpha = "abcdefghijklmnopqrstuvwxyz"
    message.each_char { |char|
        new_idx = (alpha.index(char) + keys[0]) % alpha.length
        new_str += alpha[new_idx]
        keys.rotate!
    }
    new_str
end

# 7 ---------------------------------------------------
def vowel_rotate(str)
    new_str = ""
    vowels = "aeiou"
    str_vowels = vowels_from_str(str)
    str.each_char { |char|
        if vowels.include?(char)
            new_idx = str_vowels.index(char) - 1
            new_str += str_vowels[new_idx]
        else
            new_str += char
        end
    }
    new_str
end

def vowels_from_str(str)
    arr = []
    vowels = "aeiou"
    str.each_char { |char| arr << char if vowels.include?(char) }
    arr
end

# 8 ---------------------------------------------------
class String
    def select(&prc)
        new_str = ""
        return new_str if prc == nil
        self.each_char { |char| new_str += char if prc.call(char) }
        new_str
    end

# 9 ---------------------------------------------------
    def map!(&prc)
        self.each_char.with_index { |c, i| self[i] = prc.call(c, i) }
    end
end

# 10 --------------------------------------------------
def multiply(a, b)
    if b > 0
        if b == 1
            return a
        else
            a + multiply(a, b - 1)
        end
    else
        if b == -1
            return -a
        else
            -a + multiply(a, b + 1)
        end
    end
end

# 11 --------------------------------------------------
# def lucas_sequence(n)
#     arr = []
#     (1..n).each { |seq| arr << lucas_num(seq) }
#     arr
# end

# def lucas_num(n)
#     if n == 1
#         return 2
#     elsif n == 2
#         return 1
#     else
#         lucas_num(n - 1) + lucas_num(n - 2)
#     end
# end

def lucas_sequence(n)
    arr = []

    if n == 1
      return [2]
    elsif n == 2
      return [2, 1]
    elsif n > 2
      arr += lucas_sequence(n - 1)
      arr += [lucas_sequence(n - 1)[-1] + lucas_sequence(n - 1)[-2]]
    end

    arr
end

# 12 --------------------------------------------------
def prime_factorization(num)
    arr = []

    if is_prime?(num)
      return [num]
    else
      factors_arr = factors(num)[1]
      factors_arr.each { |factor|
        arr += prime_factorization(factor)
      }
    end

    arr
end
