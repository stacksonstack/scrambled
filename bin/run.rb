require 'pry'
require 'tty-prompt'
require_relative '../config/environment'

puts "HELLO WORLD"

cli = CLI.new

binding.pry
