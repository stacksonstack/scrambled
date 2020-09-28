class Game < ActiveRecord::Base
    # attr_reader :player_id, :word_id
    belongs_to :word 
    belongs_to :player 

    # attr_accessor :status, :incorrect_guesses
    def self.start_game(player,word)
        Game.create(player: player, word: word, status: "in progress", incorrect_guesses: 0)
    end

    def game_lost
        self.status = "lost"
    end

    def game_won
        self.status = "won"
    end


end

# Game class
# Attrs: player, word, status, incorrect_guesses
#  Instance methods
# #game_over
# Class methods
# .game_start



# -game starts (Game.start_game)
# -word displayed, player enters first guess
# -check if guess matches "word"
# -if word doesnt match, 
#     +1 to incorrect guesses && check if guesses == 3 (if so, call game_lost)
#     get another guess from player & repeat
# -if word does match, call game_won
