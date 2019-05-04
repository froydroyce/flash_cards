require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'tty-box'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)


box_intro = TTY::Box.frame(
  width: 50,
  height: 15,
  top: 5,
  left: 10,
  align: :center,
  padding: 3,
  title: {top_left: 'Flashcards with Ruby'}
) do
  "Welcome!
  You're playing with 4 cards.
  Press any key to conitinue."
end

card_box_1 = TTY::Box.frame(
  width: 50,
  height: 15,
  top: 5,
  left: 10,
  align: :center,
  padding: 3,
  title: {top_left: 'Flashcards with Ruby', bottom_right: 'Card 1 of 4'}
) do
  card_1.question
end




puts box_intro


intro = gets.chomp

if intro.empty?
  puts card_box_1
end
