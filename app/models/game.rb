class Game < ActiveRecord::Base
    attr_reader :player_id, :word_id
    # attr_accessor :status, :incorrect_guesses
end