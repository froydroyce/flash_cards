class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @turns = []
    @deck = deck
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



end
