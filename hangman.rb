file = File.open("guess_words.txt", "r")
contents = file.read
words = contents.split
secret_word = words.sample
puts secret_word
