class Player < ActiveRecord::Base
    attr_reader :email_address, :password, :username
    has_many :games
    has_many :words , through: :games 

end

# Player class
#  Attrs: username, password, email_address
# Instance methods
# Get all games
# Get all wins
# Class methods
# Get all players
# Get top 10 players
