class Game < ActiveRecord::Base
    attr_reader :player_id, :word_id
    belongs_to :word 
    belongs_to :player 
    
    # attr_accessor :status, :incorrect_guesses

end