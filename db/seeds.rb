require 'rest-client' # actually let you hit the endpoint 
require 'json' # parse the response body into a form you can use 
require 'pry'
require 'random-word'
require_relative '../config/environment'

# film_response = RestClient.get("https://ghibliapi.herokuapp.com/films")
# film_data = JSON.parse(film_response)

easy_words = ["nail", "horn", "hate", "wife", "hair"]
hard_words = ["variable", "contempt", "missile", "casualty", "bishop"]

word_hash = {}
 
easy_words.each do |word|
    url = "https://api.dictionaryapi.dev/api/v2/entries/en/#{word}"
    response = RestClient.get(url)
    data = JSON.parse(response)
    # type = data[0]["meanings"][0]["partOfSpeech"]
    # difficulty = "Easy"
    # definition = data[0]["meanings"][0]["definitions"][0]["definition"]
    word_hash[word] = data
end

hard_words.each do |word|
    url = "https://api.dictionaryapi.dev/api/v2/entries/en/#{word}"
    response = RestClient.get(url)
    data = JSON.parse(response)
    type = data[0]["meanings"][0]["partOfSpeech"]
    difficulty = "Hard"
    definition = data[0]["meanings"][0]["definitions"][0]["definition"]
    word_hash[word] = data
end

#STACEY DO THIS FOR EVERY WORD
nail = Word.create({word: "nail", difficulty: "Easy", word_type: word_hash["nail"][0]["meanings"][0]["partOfSpeech"], definition: word_hash["nail"][0]["meanings"][0]["definitions"][0]["definition"] })

# url = "https://api.dictionaryapi.dev/api/v2/entries/en/#{word}"

# test_response = RestClient.get(url)
# test_data = JSON.parse(test_response)

player_1 = Player.create({username: "player_1", password: "1234", email_address: "player_1@gmail.com"})
player_2 = Player.create({username: "player_2", password: "1234", email_address: "player_2@gmail.com"})
player_3 = Player.create({username: "player_3", password: "1234", email_address: "player_3@gmail.com"})

game_1 = Game.create({word: nail, player: player_1})



# seeding!!! but i don't have models or migrations done :)

# film_data.each { |film| Film.create(film) } # if you need all keys provided by the API in your DB 
# film_data.each { |film| Film.create(api_id: film[:id], director: film[:director]) }



binding.pry