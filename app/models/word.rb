class Word < ActiveRecord::Base
    attr_reader :word_type, :definition, :word, :difficulty
    has_many :games
    has_many :players , through: :games 
    
end

# Word class
# Attrs: difficulty, hint (cond on difficulty; either word type or definition)
