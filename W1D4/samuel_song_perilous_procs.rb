# PHASE 1 --------------------------------------------------
# 1 --------------------------------------------------------
def some?(arr, &prc)
    arr.each { |el| return true if prc.call(el) }
    false
end

# 2 --------------------------------------------------------
def exactly?(arr, n, &prc)
    count = 0
    arr.each { |el| count += 1 if prc.call(el) }
    count == n ? true : false
end

# 3 --------------------------------------------------------
def filter_out(arr, &prc)
    new_arr = []
    arr.each { |el| new_arr << el if !prc.call(el) }
    new_arr
end

# 4 --------------------------------------------------------
def at_least?(arr, n, &prc)
    count = 0
    arr.each { |el| count += 1 if prc.call(el) }
    count >= n ? true : false
end

# 5 --------------------------------------------------------
def every?(arr, &prc)
    arr.each { |el| return false if !prc.call(el) }
    true
end

# 6 --------------------------------------------------------
def at_most?(arr, n, &prc)
    count = 0
    arr.each { |el| count += 1 if prc.call(el) }
    count <= n ? true : false
end

# 7 --------------------------------------------------------
def first_index(arr, &prc)
    arr.each_with_index { |el, i| return i if prc.call(el) }
    nil
end

# PHASE 2 --------------------------------------------------
# 8 --------------------------------------------------------
def xnor_select(arr, prc_1, prc_2)
    new_arr = []
    arr.each { |el| new_arr << el if (prc_1.call(el) && prc_2.call(el)) || (!prc_1.call(el) && !prc_2.call(el)) }
    new_arr
end

# 9 --------------------------------------------------------
def filter_out!(arr, &prc)
    (0..arr.length - 1).each { |i| arr[i] = nil if prc.call(arr[i]) }
    arr.compact!
end

# 10 -------------------------------------------------------
def multi_map(arr, n = 1, &prc)
    n.times { (0..arr.length - 1).each { |i| arr[i] = prc.call(arr[i]) } }
    arr
end

# 11 -------------------------------------------------------
def proctition(arr, &prc)
    part_1 = []
    part_2 = []
    arr.each { |el| prc.call(el) ? part_1 << el : part_2 << el }
    part_1 + part_2
end

# PHASE 3 --------------------------------------------------
# 12 -------------------------------------------------------
def selected_map!(arr, prc_1, prc_2)
    (0..arr.length - 1).each { |i| arr[i] = prc_2.call(arr[i]) if prc_1.call(arr[i]) }
    nil
end

# 13 -------------------------------------------------------
def chain_map(val, procs)
    procs.inject(val) { |acc, prc| prc.call(acc) }
end

# 14 -------------------------------------------------------
def proc_suffix(sent, hash)
    new_sent = []
    sent.split.each do |word|
        temp_str = ''
        hash.each { |prc, suffix| temp_str += hash[prc] if prc.call(word) }
        new_sent << word + temp_str
    end
    new_sent.join(' ')
end

# 15 -------------------------------------------------------
def proctition_platinum(arr, *prcs)
    hash = {}
    (0..prcs.length - 1).each do |i|
      hash[i + 1] = arr.select { |el| prcs[i].call(el) }
      arr.select! { |el| !prcs[i].call(el) }
    end
    hash
end

# 16 -------------------------------------------------------
def procipher(sent, hash)
    new_sent = []
    sent.split.each { |word|
        hash.each { |prc_1, prc_2| word = prc_2.call(word) if prc_1.call(word) }
        new_sent << word
    }
    new_sent.join(' ')
end

# 17 -------------------------------------------------------
def picky_procipher(sent, hash)
    new_sent = []
    sent.split.each { |word|
        changed = false
        hash.each { |prc_1, prc_2|
            if prc_1.call(word) && changed == false
                new_sent << prc_2.call(word)
                changed = true
            end
        }
        new_sent << word if changed == false
    }
    new_sent.join(' ')
end
