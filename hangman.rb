def choose_word
  file = File.open("guess_words.txt", "r")
  contents = file.read
  words = contents.split
  secret_word = words.sample
  while secret_word.length < 5 || secret_word.length > 12
    secret_word = words.sample
  end
  file.close
  puts secret_word
end
choose_word
