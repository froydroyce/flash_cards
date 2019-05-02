class Round
  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @turns = []
    @deck = deck
    @number_correct = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns.push(new_turn)
    @deck.cards.rotate!
    new_turn
  end

def number_correct
  @guess == @turns.first.answer
  @number_correct += 1
end




end
