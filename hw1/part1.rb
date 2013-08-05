#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.
# 11
# add comment
# second comment 1
# third comment 2
def palindrome?(str)
  flat_str = str.gsub /[\W+]/, ''
  reverse_str = flat_str.reverse
  if reverse_str.downcase! == flat_str.downcase!
    return true
  end
  return false
end

def count_words(str)
  str = str.to_s
  if str.nil?
    return {}
  end
  words = str.downcase.split /[\W+]/
  words_s = Hash[words.group_by {
    |w| w
  }.map {
    |k, v| [k, v.size]
  }]
  return words_s
end

word_count = count_words ""
word_count = count_words "asd"
puts word_count
