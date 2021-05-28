# PHASE 1 -------------------------------------------
# 1 -------------------------------------------------
def duos(str)
    count = 0
    (0...str.length - 1).each { |i| count += 1 if str[i] == str[i + 1] }
    count
end

# 2 -------------------------------------------------
def sentence_swap(sent, hash)
    sent.split.map { |word| hash.include?(word) ? hash[word] : word }.join(' ')
end

# 3 -------------------------------------------------
def hash_mapped(hash, prc, &blc)
    new_h = {}
    hash.each { |k, v| new_h[blc.call(k)] = prc.call(v) }
    new_h
end

# 4 -------------------------------------------------
def counted_characters(str)
    arr = []
    hash = Hash.new(0)
    str.each_char { |char| hash[char] += 1 }
    hash.each { |k, v| arr << k if v > 2 }
    arr
end

# 5 -------------------------------------------------
def triplet_true(str)
    (0...str.length - 2).each { |i| return true if str[i] == str[i+1] && str[i] == str[i + 2] }
    false
end

# 6 -------------------------------------------------
def energetic_encoding(str, hash)
    str.split.map { |word| replace_chars(word, hash) }.join(' ')
end

def replace_chars(word, hash)
    word.split('').map { |char| hash.include?(char) ? hash[char] : '?' }.join('')
end

# 7 -------------------------------------------------
def uncompress(str)
    new_str = ''
    i = 0
    while i < str.length - 1
        str[i + 1].to_i.times { new_str += str[i] }
        i += 2
    end
    new_str
end

# PHASE 2 -------------------------------------------
# 8 -------------------------------------------------
def conjunct_select(arr, *prcs)
    arr.select { |el| prcs.all? { |prc| prc.call(el) } }
end

# 9 -------------------------------------------------
def convert_pig_latin(sent)
    new_sent = sent.downcase.split.map { |word| word.length < 3 ? word : translate_to_pig_latin(word) }
    sent.split.each_with_index { |word, i| new_sent[i][0] = new_sent[i][0].upcase if word[0] == word[0].upcase }
    new_sent.join(' ')
end

def translate_to_pig_latin(word)
    vowels = 'aeiouAEIOU'
    if vowels.include?(word[0])
        word + 'yay'
    else
        word[first_v(word)..-1] + word[0...first_v(word)] + 'ay'
    end
end

def first_v(word)
    vowels = 'aeiouAEIOU'
    word.each_char.with_index { |char, i| return i if vowels.include?(char) }
end

# 10 ------------------------------------------------
def reverberate(sent)
    sent.split.map { |word| word.length < 3 ? word : translate_reverb(word) }
end

def translate_reverb(word)
    vowels = 'aeiouAEIOU'
    if vowels.include?(word[-1])
        word + word.downcase
    else
        word + word[last_v(word)..-1]
    end
end

def last_v(word)
    vowels = 'aeiouAEIOU'
    (word.length - 1).downto(0).each { |i| return i if vowels.include?(word[i]) }
end

# 11 ------------------------------------------------
def disjunct_select(arr, *prcs)
    arr.select { |el| prcs.any? { |prc| prc.call(el) } }
end

# 12 ------------------------------------------------
def alternating_vowel(sent)
    sent.split.map { |word| sent.split.index(word).even? ? rm_first_v(word) : rm_last_v(word) }.join(' ')
end

def rm_first_v(word)
    vowels = 'aeiou'
    word.each_char.with_index { |char, i| return word[0...i] + word[i + 1..-1] if vowels.include?(char) }
end

def rm_last_v(word)
    vowels = 'aeiou'
    (word.length - 1).downto(0).each { |i| return word[0...i] + word[i + 1..-1] if vowels.include?(word[i]) }
end

# 13 ------------------------------------------------
def silly_talk(sent)
    vowels = 'aeiouAEIOU'
    sent.split.map { |word| vowels.include?(word[-1]) ? word + word[-1] : translate_silly(word) }.join(' ')
end

def translate_silly(word)
    vowels = 'aeiouAEIOU'
    new_word = ''
    word.each_char { |char| vowels.include?(char) ? new_word += char + 'b' + char.downcase : new_word += char }
    new_word
end

# 14 ------------------------------------------------
def compress(str)
    new_str = ''
    count = 1
    (0..str.length - 1).each do |i|
        if str[i] == str[i + 1] || str[i] == nil
            count += 1
        else
            new_str += str[i]
            new_str += count.to_s if count > 1
            count = 1
        end
    end
    new_str
end
