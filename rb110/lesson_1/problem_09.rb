def titleize(string)
  string.split.map(&:capitalize).join(' ')
end

words = "the flintstones rock"
titleize(words)
