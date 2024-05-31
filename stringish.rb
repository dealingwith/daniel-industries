def titleize(string)
  nocap = ['a', 'an', 'the', 'and', 'as', 'if', 'at', 'but', 'by', 'for', 'from', 'in', 'into', 'like', 'near', 'now', 'that', 'nor', 'of', 'off', 'on', 'once', 'onto', 'or', 'over', 'past', 'so', 'than', 'till', 'to', 'up', 'upon', 'with', 'when', 'yet']
  
  array = string.split(" ").map do |word|
    if (word != word.upcase && (word == string.split(" ").first || !nocap.include?(word)))
      word.capitalize
    else
      word
    end
  end
  array.join(" ")
end

def decap(string)
  string.split(" ").map do |word|
    titleize(word.downcase)
  end.join(" ")
end

def desmart(string)
  string.gsub(/[“”]/, '"').gsub(/[‘’]/, "'")
end
