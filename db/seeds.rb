require 'rest-client'
require 'json'
require 'pry'
require 'random-word'
require_relative '../config/environment'

Player.destroy_all
Game.destroy_all
Word.destroy_all

easy_words = ["nail", "horn", "hate", "wife", "hair"]
hard_words = ["variable", "contempt", "missile", "casualty", "bishop"]

word_hash = {}
 
# easy_words.each do |word|
#     url = "https://api.dictionaryapi.dev/api/v2/entries/en/#{word}"
#     response = RestClient.get(url)
#     data = JSON.parse(response)
#     word_hash[word] = data
# end

# hard_words.each do |word|
#     url = "https://api.dictionaryapi.dev/api/v2/entries/en/#{word}"
#     response = RestClient.get(url)
#     data = JSON.parse(response)
#     word_hash[word] = data
# end

# #word instances
# nail = Word.create({word: "nail", difficulty: "Easy", word_type: word_hash["nail"][0]["meanings"][0]["partOfSpeech"], definition: word_hash["nail"][0]["meanings"][0]["definitions"][0]["definition"] })
# horn = Word.create({word: "horn", difficulty: "Easy", word_type: word_hash["horn"][0]["meanings"][0]["partOfSpeech"], definition: word_hash["horn"][0]["meanings"][0]["definitions"][0]["definition"] })
# hate = Word.create({word: "hate", difficulty: "Easy", word_type: word_hash["hate"][0]["meanings"][0]["partOfSpeech"], definition: word_hash["hate"][0]["meanings"][0]["definitions"][0]["definition"] })
# wife = Word.create({word: "wife", difficulty: "Easy", word_type: word_hash["wife"][0]["meanings"][0]["partOfSpeech"], definition: word_hash["wife"][0]["meanings"][0]["definitions"][0]["definition"] })
# hair = Word.create({word: "hair", difficulty: "Easy", word_type: word_hash["hair"][0]["meanings"][0]["partOfSpeech"], definition: word_hash["hair"][0]["meanings"][0]["definitions"][0]["definition"] })

# variable = Word.create({word: "variable", difficulty: "Hard", word_type: word_hash["variable"][0]["meanings"][0]["partOfSpeech"], definition: word_hash["variable"][0]["meanings"][0]["definitions"][0]["definition"] })
# contempt = Word.create({word: "contempt", difficulty: "Hard", word_type: word_hash["contempt"][0]["meanings"][0]["partOfSpeech"], definition: word_hash["contempt"][0]["meanings"][0]["definitions"][0]["definition"] })
# missile = Word.create({word: "missile", difficulty: "Hard", word_type: word_hash["missile"][0]["meanings"][0]["partOfSpeech"], definition: word_hash["missile"][0]["meanings"][0]["definitions"][0]["definition"] })
# casualty = Word.create({word: "casualty", difficulty: "Hard", word_type: word_hash["casualty"][0]["meanings"][0]["partOfSpeech"], definition: word_hash["casualty"][0]["meanings"][0]["definitions"][0]["definition"] })
# bishop = Word.create({word: "bishop", difficulty: "Hard", word_type: word_hash["bishop"][0]["meanings"][0]["partOfSpeech"], definition: word_hash["bishop"][0]["meanings"][0]["definitions"][0]["definition"] })

#player instances
player_1 = Player.create({username: "player_1", password: "1234", email_address: "player_1@gmail.com"})
player_2 = Player.create({username: "player_2", password: "1234", email_address: "player_2@gmail.com"})
player_3 = Player.create({username: "player_3", password: "1234", email_address: "player_3@gmail.com"})

# #game instances
# game_1 = Game.create({word: nail, player: player_1, status: "won", incorrect_guesses: 1})
# game_2 = Game.create({word: bishop, player: player_1, status: "lost", incorrect_guesses: 1})
# game_3 = Game.create({word: contempt, player: player_2, status: "won", incorrect_guesses: 1})
# game_4 = Game.create({word: hair, player: player_1, status: "won", incorrect_guesses: 1})
# game_5 = Game.create({word: wife, player: player_3, status: "won", incorrect_guesses: 1})
# game_6 = Game.create({word: hate, player: player_3, status: "won", incorrect_guesses: 1})
# game_7 = Game.create({word: bishop, player: player_3, status: "won", incorrect_guesses: 1})
# game_8 = Game.create({word: variable, player: player_3, status: "won", incorrect_guesses: 1})

#too many API calls tests:
hair = Word.create({word: "hair", difficulty: "Easy", word_type: "test", definition: "test"})
variable = Word.create({word: "variable", difficulty: "Hard", word_type: "test", definition: "test"})
game_8 = Game.create({word: variable, player: player_3, status: "won", incorrect_guesses: 1})
game_4 = Game.create({word: hair, player: player_1, status: "won", incorrect_guesses: 1})
hate = Word.create({word: "hair", difficulty: "Easy", word_type: "test", definition: "test"})
wife = Word.create({word: "wife", difficulty: "Easy", word_type: "test", definition: "test"})

