# Hangman

A classic word-guessing game, where the player tries to guess a secret word by suggesting letters. The player has a limited number of chances to guess the word, and each incorrect guess reduces the number of remaining chances.

## How to play

To play the game, run the `hangman.rb` file in a Ruby interpreter. Follow the prompts to enter your guesses. You can save your progress and exit the game at any time by typing 'save' and pressing enter. To resume a saved game, run the `hangman.rb` file and choose 'load' when prompted.

## Requirements

- Ruby 2.5 or higher
- The `yaml` gem (install with `gem install yaml`)

## File list

- `hangman.rb`: the main game file
- `guess_words.txt`: a text file containing a list of words that the game can use as secret words
- `hangman_save.yml`: a YAML file used to save and load game progress

## Known issues

- The game may crash if the `hangman_save.yml` file is corrupted or not in the expected format. If this happens, delete the file and start a new game.

## Credits

- This project is part of the [Odin Project](https://www.theodinproject.com/), a comprehensive curriculum for learning web development.
- The word list in `guess_words.txt` was sourced from [https://github.com/first20hours/google-10000-english](https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt).