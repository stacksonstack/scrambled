class Game < ActiveRecord::Base
    belongs_to :word 
    belongs_to :player 

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