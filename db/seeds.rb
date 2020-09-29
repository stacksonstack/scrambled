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
 
easy_words.each do |word|
    url = "https://api.dictionaryapi.dev/api/v2/entries/en/#{word}"
    response = RestClient.get(url)
    data = JSON.parse(response)
    word_hash[word] = data
end

hard_words.each do |word|
    url = "https://api.dictionaryapi.dev/api/v2/entries/en/#{word}"
    response = RestClient.get(url)
    data = JSON.parse(response)
    word_hash[word] = data
end

#STACEY DO THIS FOR EVERY WORD
nail = Word.create({word: "nail", difficulty: "Easy", word_type: word_hash["nail"][0]["meanings"][0]["partOfSpeech"], definition: word_hash["nail"][0]["meanings"][0]["definitions"][0]["definition"] })

player_1 = Player.create({username: "player_1", password: "1234", email_address: "player_1@gmail.com"})
player_2 = Player.create({username: "player_2", password: "1234", email_address: "player_2@gmail.com"})
player_3 = Player.create({username: "player_3", password: "1234", email_address: "player_3@gmail.com"})

game_1 = Game.create({word: nail, player: player_1, status: "won", incorrect_guesses: 1})
game_2 = Game.create({word: nail, player: player_1, status: "lost", incorrect_guesses: 1})
game_3 = Game.create({word: nail, player: player_2, status: "won", incorrect_guesses: 1})
game_4 = Game.create({word: nail, player: player_1, status: "won", incorrect_guesses: 1})
game_5 = Game.create({word: nail, player: player_3, status: "won", incorrect_guesses: 1})
game_6 = Game.create({word: nail, player: player_3, status: "won", incorrect_guesses: 1})
game_7 = Game.create({word: nail, player: player_3, status: "won", incorrect_guesses: 1})
game_8 = Game.create({word: nail, player: player_3, status: "won", incorrect_guesses: 1})



# seeding!!! but i don't have models or migrations done :)

# film_data.each { |film| Film.create(film) } # if you need all keys provided by the API in your DB 
# film_data.each { |film| Film.create(api_id: film[:id], director: film[:director]) }



binding.pry