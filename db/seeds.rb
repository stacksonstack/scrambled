require 'rest-client' # actually let you hit the endpoint 
require 'json' # parse the response body into a form you can use 
require 'pry'

film_response = RestClient.get("https://ghibliapi.herokuapp.com/films")
film_data = JSON.parse(film_response)

# seeding!!! but i don't have models or migrations done :)
# film_data.each { |film| Film.create(film) } # if you need all keys provided by the API in your DB 
# film_data.each { |film| Film.create(api_id: film[:id], director: film[:director]) }



binding.pry