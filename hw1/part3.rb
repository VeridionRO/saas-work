def combine_anagrams(words)
  return words.map {
    |val| [val.downcase.chars.sort.join, val]
  }.group_by{
    |m1, m2| m1
  }.values.map{
    |val|
  val.map{
    |new_val| new_val[1]
  }
}
end

print combine_anagrams ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']
#the third hoemwork
