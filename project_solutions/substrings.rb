require 'pry-byebug'
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def count_substring(string, substring)
    if string == nil
        return 0
    end
    substring_index = string.index(substring)
    if substring_index == nil
        return 0
    end
    return 1 + count_substring(string[(substring_index + substring.length)..nil], substring)
end

def substrings(string, dictionary)
    result = {}
    lowercase_string = string.downcase
    dictionary.each do |word|
        result[word] = count_substring(lowercase_string, word)
    end
    result.select{|k, v| v != 0}
end

# Cach 2: Dung ham cua ruby
def substrings_2(string, dictionary)
    result = {}
    lowercase_string = string.downcase
    dictionary.each do |word|
        result[word] = lowercase_string.scan(word).length if lowercase_string.scan(word).length != 0
    end
    result
end

puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary) == substrings_2("Howdy partner, sit down! How's it going?", dictionary)