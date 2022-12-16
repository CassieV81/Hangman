def choose_word
  file = File.open("guess_words.txt", "r")
  contents = file.read
  words = contents.split
  secret_word = words.sample
  while secret_word.length < 5 || secret_word.length > 12
    secret_word = words.sample
  end
  file.close
  secret_word
end

secret_word = choose_word
guessed_letters = []
remaining_chances = 6

while remaining_chances > 0
  print "Enter your guess: "
  guess = gets.chomp
  
  if secret_word.include?(guess)
    guessed_letters.push(guess)
    puts "Correct! #{guess} is in the secret word."
  else
    remaining_chances -= 1
    puts "Incorrect! #{guess} is not in the secret word. You have #{remaining_chances} remaining chances"
  end
end