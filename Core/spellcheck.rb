# This code is based on Peter Norvig's code and adapted by Logic technologies
# I am not the author

class Spellcheck

  def initialize

    # the file to read
    dictionnary = File.new("#{Dir.getwd}/core/names.txt").read
    # reads input text
    text_to_words = find_words(dictionnary)
    # reads input text, and creates word bank "nwords"
    @nwords = train(text_to_words)
    # creates a string containing all letters of the alphabet
    @letters = ("a".."z").to_a.join

  end
  # returns an array of all permutations matching the input text in lowercase letters

  def nwords; return @nwords end
  def letters; return @letters end

  def run params = nil
    return "did you mean #{correct(params.first)}?"
  end

  def find_words text
    # scans the input text with regular expressions
    return text.downcase.scan(/[a-z]+/)
    # puts text.downcase.scan(/[a-z]+/)
  end

  # dunno what this does yet
  def train features
    model = Hash.new(1)
    features.each {|f| model[f] += 1 }
    return model
  end

  def edits1 word
    
    n = word.length

    deletion = (0...n).collect {|i| word[0...i]+word[i+1..-1] }
    transposition = (0...n-1).collect {|i| word[0...i]+word[i+1,1]+word[i,1]+word[i+2..-1] }
    alteration = []
    n.times {|i| letters.each_byte {|l| alteration << word[0...i]+l.chr+word[i+1..-1] } }
    insertion = []
    (n+1).times {|i| letters.each_byte {|l| insertion << word[0...i]+l.chr+word[i..-1] } }
    result = deletion + transposition + alteration + insertion
    result.empty? ? nil : result
  end

  def known_edits2 word
    result = []
    edits1(word).each {|e1| edits1(e1).each {|e2| result << e2 if nwords.has_key?(e2) }}
    result.empty? ? nil : result
  end

  # lists words matching dictionnary
  def known words
    # lists an array of all words in input text that can be found in "nwords"
    result = words.find_all {|w| nwords.has_key?(w) }
    # if no words can be found, return nil, otherwise return results
    result.empty? ? nil : result
  end

  # returns one of many options
  def correct word
    # returns the longest word of the following options:
    # a complete or partial word
    # a word with "edits1" applied to it
    # a word with "known_edits2" applied to it
    # the exact input word
    return (known([word]) or known(edits1(word)) or known_edits2(word) or [word]).max {|a,b| nwords[a] <=> nwords[b] }
  
  end
end

# badkins:~/sync/code/ruby$ irb
# irb(main):001:0> require 'spelling_corrector.rb'
# => true
# irb(main):002:0> correct "whree"
# => "where"