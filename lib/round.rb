class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @turns = []
    @deck = deck
  end

  def current_card
    @deck.cards.first
  end



end
