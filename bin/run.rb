require 'pry'
require 'tty-prompt'
require_relative '../config/environment'


word = RandomWord.nouns.next
new_word = "didn't change"
if word.include?("_")
    new_word = word.split("_")[0]
end


url = "https://api.dictionaryapi.dev/api/v2/entries/en/hello"

test_response = RestClient.get(url)
test_data = JSON.parse(test_response)


binding.pry

cli = CLI.new


