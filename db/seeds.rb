require 'rest-client'
require 'json'
require 'pry'
require_relative '../config/environment'

Player.destroy_all
Game.destroy_all
Word.destroy_all

# word instances - API call method
# easy_words = ["nail", "horn", "hate", "wife", "hair"]
# hard_words = ["variable", "contempt", "missile", "casualty", "bishop"]

# word_hash = {}
 
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

#word instances - manual method
nail = Word.create({word: "nail", difficulty: "Easy", word_type: "noun", definition: "a slender, typically rod-shaped rigid piece of metal" })
horn = Word.create({word: "horn", difficulty: "Easy", word_type: "noun", definition: "a wind instrument, usually made of brass or other metal or plastic"})
hate = Word.create({word: "hate", difficulty: "Easy", word_type: "verb", definition: "to dislike intensely or passionately"})
wife = Word.create({word: "wife", difficulty: "Easy", word_type: "noun", definition: "a married woman"})
hair = Word.create({word: "hair", difficulty: "Easy", word_type: "noun", definition: "any of the numerous fine, usually cylindrical, keratinous filaments growing from the skin of humans and animals"})
delay = Word.create({word: "delay", difficulty: "Easy", word_type: "verb", definition: "to put off to a later time"})
iron = Word.create({word: "iron", difficulty: "Easy", word_type: "noun", definition: "something hard, strong, rigid, unyielding, or the like"})
unit = Word.create({word: "unit", difficulty: "Easy", word_type: "noun", definition: "a single thing or person"})
game = Word.create({word: "game", difficulty: "Easy", word_type: "noun", definition: "an amusement or pastime"})
coin = Word.create({word: "coin", difficulty: "Easy", word_type: "noun", definition: "a piece of metal stamped and issued by the authority of a government for use as money"})

variable = Word.create({word: "variable", difficulty: "Hard", word_type: "adjective", definition: "apt or liable to vary or change"})
contempt = Word.create({word: "contempt", difficulty: "Hard", word_type: "noun", definition: "the state of being despised"})
missile = Word.create({word: "missile", difficulty: "Hard", word_type: "noun", definition: "an object or weapon for throwing, hurling, or shooting, as a stone, bullet, or arrow"})
casualty = Word.create({word: "casualty", difficulty: "Hard", word_type: "noun", definition: "one who is injured or killed in an accident" })
bishop = Word.create({word: "bishop", difficulty: "Hard", word_type: "noun", definition: "a spiritual supervisor, overseer, or the like" })
excavate = Word.create({word: "excavate", difficulty: "Hard", word_type: "verb", definition: "to make (a hole, tunnel, etc.) by removing material" })
exercise = Word.create({word: "exercise", difficulty: "Hard", word_type: "noun", definition: "bodily or mental exertion" })
bucket = Word.create({word: "bucket", difficulty: "Hard", word_type: "noun", definition: "a pail" })
tournament = Word.create({word: "tournament", difficulty: "Hard", word_type: "noun", definition: "a trial of skill in some game, in which competitors play a series of contests" })
nominate = Word.create({word: "nominate", difficulty: "Hard", word_type: "verb", definition: "to propose (someone) for appointment or election to an office" })

#player instances
stacey = Player.create({username: "stacey", password: "1234567", email_address: "stacey@gmail.com"})
billy = Player.create({username: "billy", password: "1234567", email_address: "billy@gmail.com"})
fred = Player.create({username: "fred", password: "1234567", email_address: "fred@gmail.com"})
anthony = Player.create({username: "anthony", password: "1234567", email_address: "anthony@gmail.com"})
caryn = Player.create({username: "caryn", password: "1234567", email_address: "caryn@gmail.com"})
mary = Player.create({username: "mary", password: "1234567", email_address: "mary@gmail.com"})
sally = Player.create({username: "sally", password: "1234567", email_address: "sally@gmail.com"})
eric = Player.create({username: "eric", password: "1234567", email_address: "eric@gmail.com"})
nick = Player.create({username: "nick", password: "1234567", email_address: "nick@gmail.com"})
andrew = Player.create({username: "andrew", password: "1234567", email_address: "andrew@gmail.com"})


# #game instances
game_1 = Game.create({word: nail, player: stacey, status: "won", incorrect_guesses: 1})
game_2 = Game.create({word: bishop, player: stacey, status: "lost", incorrect_guesses: 3})
game_3 = Game.create({word: contempt, player: fred, status: "won", incorrect_guesses: 2})
game_4 = Game.create({word: hair, player: stacey, status: "won", incorrect_guesses: 0})
game_5 = Game.create({word: wife, player: billy, status: "lost", incorrect_guesses: 3})
game_6 = Game.create({word: hate, player: fred, status: "won", incorrect_guesses: 1})
game_7 = Game.create({word: bishop, player: billy, status: "lost", incorrect_guesses: 3})
game_8 = Game.create({word: variable, player: andrew, status: "won", incorrect_guesses: 1})
game_9 = Game.create({word: unit, player: caryn, status: "won", incorrect_guesses: 1})
game_10 = Game.create({word: variable, player: fred, status: "won", incorrect_guesses: 1})
game_11 = Game.create({word: bucket, player: fred, status: "won", incorrect_guesses: 2})
game_12 = Game.create({word: exercise, player: sally, status: "won", incorrect_guesses: 2})
game_13 = Game.create({word: coin, player: nick, status: "won", incorrect_guesses: 2})
game_14 = Game.create({word: casualty, player: eric, status: "won", incorrect_guesses: 2})
game_15 = Game.create({word: missile, player: anthony, status: "won", incorrect_guesses: 2})
game_16 = Game.create({word: nominate, player: mary, status: "won", incorrect_guesses: 2})

