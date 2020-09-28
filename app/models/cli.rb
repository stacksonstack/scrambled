require 'rest-client' 
require 'json'
require 'pry'

class CLI 

    def welcome
        puts "Welcome to Studio Ghibli Fan Club!"
        puts "What's your name?"
        name = gets.chomp
        User.create(name: name)

        self.menu 
        binding.pry 
    end

    def menu
        puts "Choose an option!"
        puts "1. View all films"
        puts "2. View all characters"
        choice = gets.chomp 
        
    end

    def search_songs
        puts "What song are you looking for?"
        search_term = gets.chomp
        # 1. RestClient.get("spotify.api/searchQuery")
        # 2. JSON.parse
        # 3. Let the user make some choices 
        # 4. Say they choose a favorite, make the updates to your 
        #     DB to save the song info you need easy access to and to represent the favorite 
    end

end