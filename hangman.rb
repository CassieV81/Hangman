require 'yaml'

def save_game(secret_word, guessed_letters, remaining_chances)
  File.open("hangman_save.yml", "w") do |file|
    file.puts({
      secret_word: secret_word,
      guessed_letters: guessed_letters,
      remaining_chances: remaining_chances
    }.to_yaml)
  end
end

def load_game
  YAML.load_file("hangman_save.yml")
end

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
puts secret_word
guessed_letters = []
remaining_chances = 6

def display_word(secret_word, guessed_letters)
  secret_word.chars.map do |char|
    if guessed_letters.include?(char)
      char
    else
      "_"
    end
  end.join(" ")
end

while remaining_chances > 0
  puts "Secret word: #{display_word(secret_word, guessed_letters)}"

  print "Enter your guess: "
  guess = gets.chomp

  if guess == 'save'
    save_game(secret_word, guessed_letters, remaining_chances)
    puts "Game saved!"
    break
  end

  puts "Letters guessed: #{guessed_letters.join(', ')}"
  
  if secret_word.include?(guess)
    guessed_letters.push(guess)
    puts "Correct! #{guess} is in the secret word."
  else
    remaining_chances -= 1
    puts "Incorrect! #{guess} is not in the secret word. You have #{remaining_chances} remaining chances"
  end

  #End loop

  if secret_word.chars.all? { |char| guessed_letters.include?(char) }
    puts "You win! You guessed the secret word, #{secret_word}."
    return
  elsif remaining_chances == 0
    puts "You lose! The secret word was #{secret_word}."
    return
  end
end

