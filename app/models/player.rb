class Player < ActiveRecord::Base
    attr_reader :email_address, :password, :username
    has_many :games
    has_many :words , through: :games 

end