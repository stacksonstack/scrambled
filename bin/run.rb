require 'pry'
require 'tty-prompt'
require 'artii'
require_relative '../config/environment'





# binding.pry


a = Artii::Base.new :font => 'slant'
a.asciify('TEST!')
binding.pry

# cli = CLI.new


