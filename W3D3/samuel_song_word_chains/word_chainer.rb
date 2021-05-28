require "set"

class WordChainer

  def initialize(dictionary_file_name)
    file = File.open("dictionary.txt")
    @dictionary = file.readlines.map(&:chomp).to_set
  end

  def adjacent_words(my_word)
    @dictionary.select { |dict_word| one_letter_off?(my_word, dict_word) }
  end

  def one_letter_off?(word_1, word_2)
    diff = 0
    (0...word_1.length).each { |idx| diff += 1 if word_1[idx] != word_2[idx] }
    diff == 1 && word_1.length == word_2.length ? true : false
  end

end
