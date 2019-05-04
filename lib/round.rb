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

  def percent_correct
    (@number_correct.to_f / @turns.count) * 100
  end

  def percent_correct_by_category(category)
    turns_in_category = @turns.find_all do |turn|
      turn.card.category == category
    end
    correct_in_category = turns_in_category.find_all do |turn|
      turn.correct?
    end
    (@number_correct.to_f / correct_in_category.count) * 100
  end

  def number_correct_by_category(category)
    turns_in_category = @turns.find_all do |turn|
      turn.card.category == category
    end
    correct_in_category = turns_in_category.find_all do |turn|
      turn.correct?
    end
    correct_in_category.count
  end

end
