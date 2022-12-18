require 'yaml'

class Hangman
  attr_reader :secret_word, :guessed_letters, :remaining_chances

  def initialize(secret_word, guessed_letters, remaining_chances)
    @secret_word = secret_word
    @guessed_letters = guessed_letters
    @remaining_chances = remaining_chances
  end

  def self.load
    data = YAML.load_file("hangman_save.yml")
    new(data[:secret_word], data[:guessed_letters], data[:remaining_chances])
  end

  def save
    File.open("hangman_save.yml", "w") do |file|
      file.puts({
        secret_word: secret_word,
        guessed_letters: guessed_letters,
        remaining_chances: remaining_chances
      }.to_yaml)
    end
  end

  def display_word
    secret_word.chars.map do |char|
      if guessed_letters.include?(char)
        char
      else
        "_"
      end
    end.join(" ")
  end

  def self.choose_word
    words = []

    File.open("guess_words.txt", "r") do |file|
      file.each_line do |line|
        word = line.strip
        words << word if word.length >= 5 && word.length <= 12
      end
    end

    words.sample
  end
end

puts "Welcome to Hangman! Do you want to start a new game or load a saved game? (Type 'new' or 'load')"
input = gets.chomp

if input == 'load'
  game = Hangman.load
else
  secret_word = Hangman.choose_word
  game = Hangman.new(secret_word, [], 6)
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
    puts "Incorrect! Try again... You have #{remaining_chances} remaining chances"
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

