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
    if new_turn.correct?
      @number_correct += 1
    end
    @deck.cards.rotate!
    new_turn
  end







end
