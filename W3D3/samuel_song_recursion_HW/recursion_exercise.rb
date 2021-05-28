# Exercise 1 -----------------------------------------
def sum_to(n)
  return 1 if n == 1
  if n > 0
    n + sum_to(n - 1)
  else
    n + sum_to(n + 1)
  end
end

# Exercise 2 -----------------------------------------
def add_numbers(nums_array)
  return nil if nums_array.length == 0
  return nums_array[0] if nums_array.length == 1
  nums_array[0] + add_numbers(nums_array[1..-1])
end

# Exercise 3 -----------------------------------------
def gamma_fnc(n)
  return nil if n == 0
  return 1 if n == 1
  (n - 1) * gamma_fnc(n - 1)
end

# Exercise 4 -----------------------------------------
def ice_cream_shop(flavors, favorite)
  return false if flavors.length == 0
  flavors[0] == favorite || ice_cream_shop(flavors[1..-1], favorite)
end

# Exercise 5 -----------------------------------------
def reverse(string)
  return string if string.length == 0
  string[-1] + reverse(string[0...-1])
end
