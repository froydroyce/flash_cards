require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'tty-box'

box_intro = TTY::Box.frame(
  width: 30,
  height: 10,
  align: :center,
  padding: 3
) do
  "Welcome to Flashards with Ruby!"
end

print box_intro
