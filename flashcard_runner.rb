require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'tty-box'
require 'pry'

@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card_2 = Card.new("What is the capital of South Korea?", "Seoul", :Geography)
@card_3 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card_4 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
@deck = Deck.new([@card_1, @card_2, @card_3, @card_4])
@round = Round.new(@deck)

box_intro = TTY::Box.frame(
  width: 50,
  height: 15,
  align: :center,
  padding: 5,
  title: {top_left: 'Flashcards with Ruby'}
) do
  "Welcome!
  You're playing with 4 cards.
  Press Enter to conitinue."
end

puts box_intro
intro = gets.strip
if intro.empty?

  card_box = TTY::Box.frame(
    width: 50,
    height: 15,
    align: :center,
    padding: 5,
    title: {top_left: 'Flashcards with Ruby', bottom_right: "Card #{@round.turns.count + 1} of 4"}
  ) do
    @round.current_card.question
  end

  puts card_box
  puts "Your answer?"
  guess = gets.chomp.capitalize
  new_turn = @round.take_turn(guess)
  puts @round.turns.last.feedback

  card_box = TTY::Box.frame(
    width: 50,
    height: 15,
    align: :center,
    padding: 5,
    title: {top_left: 'Flashcards with Ruby', bottom_right: "Card #{@round.turns.count + 1} of 4"}
  ) do
    @round.current_card.question
  end

  puts card_box
  puts "Your answer?"
  guess = gets.chomp.capitalize
  @round.take_turn(guess)
  puts @round.turns.last.feedback

  card_box = TTY::Box.frame(
    width: 50,
    height: 15,
    align: :center,
    padding: 5,
    title: {top_left: 'Flashcards with Ruby', bottom_right: "Card #{@round.turns.count + 1} of 4"}
  ) do
    @round.current_card.question
  end

  puts card_box
  puts "Your answer?"
  guess = gets.chomp.capitalize
  @round.take_turn(guess)
  puts @round.turns.last.feedback

  card_box = TTY::Box.frame(
    width: 50,
    height: 15,
    align: :center,
    padding: 5,
    title: {top_left: 'Flashcards with Ruby', bottom_right: "Card #{@round.turns.count + 1} of 4"}
  ) do
    @round.current_card.question
  end

  puts card_box
  puts "Your answer?"
  guess = gets.chomp.capitalize
  @round.take_turn(guess)
  puts @round.turns.last.feedback
end
  if @round.turns.count == 4
    game_over = TTY::Box.frame(
      width: 50,
      height: 15,
      align: :center,
      padding: 3,
      title: {top_left: 'Flashcards with Ruby'}
    ) do
      "****** Game Over! ******\nYou had #{@round.number_correct} correct guesses out of 4 for a total score of #{@round.percent_correct}%.\nSTEM - #{@round.percent_correct_by_category(:STEM)}% correct\nGeography - #{@round.percent_correct_by_category(:Geography)}% correct"
    end
    puts game_over
  end
