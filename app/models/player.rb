class Player < ActiveRecord::Base
    attr_reader :email_address, :password, :username
end