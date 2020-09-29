require 'artii'
require 'colorize'

def welcome_animation
    a = Artii::Base.new
    puts a.asciify("WELCOME").colorize(:magenta)
    sleep(0.5)
    puts a.asciify("TO").colorize(:magenta)
    sleep(0.5)
    puts a.asciify("SRBMACEDL!").colorize(:cyan)
    sleep(1.2)
    system "clear"
    puts a.asciify("SRBMACEDL!").colorize(:cyan)
    puts a.asciify("S").colorize(:cyan)
    sleep(0.2)
    system "clear"
    puts a.asciify("SRBMACEDL!").colorize(:cyan)
    puts a.asciify("SC").colorize(:cyan)
    sleep(0.2)
    system "clear"
    puts a.asciify("SRBMACEDL!").colorize(:cyan)
    puts a.asciify("SCR").colorize(:cyan)
    sleep(0.2)
    system "clear"
    puts a.asciify("SRBMACEDL!").colorize(:cyan)
    puts a.asciify("SCRA").colorize(:cyan)
    sleep(0.2)
    system "clear"
    puts a.asciify("SRBMACEDL!").colorize(:cyan)
    puts a.asciify("SCRAM").colorize(:cyan)
    sleep(0.2)
    system "clear"
    puts a.asciify("SRBMACEDL!").colorize(:cyan)
    puts a.asciify("SCRAMB").colorize(:cyan)
    sleep(0.2)
    system "clear"
    puts a.asciify("SRBMACEDL!").colorize(:cyan)
    puts a.asciify("SCRAMBL").colorize(:cyan)
    sleep(0.2)
    system "clear"
    puts a.asciify("SRBMACEDL!").colorize(:cyan)
    puts a.asciify("SCRAMBLE").colorize(:cyan)
    sleep(0.2)
    system "clear"
    puts a.asciify("SRBMACEDL!").colorize(:cyan)
    puts a.asciify("SCRAMBLED").colorize(:cyan)
    sleep(0.2)
    system "clear"
    puts a.asciify("SRBMACEDL!").colorize(:cyan)
    puts a.asciify("SCRAMBLED!").colorize(:cyan)
    sleep(1)
    system "clear"
    puts a.asciify("SCRAMBLED!").colorize(:cyan)
end