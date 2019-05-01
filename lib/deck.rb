class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(category)
    categorized_cards = []
      cards.each do |card|
        if card.category == category
          categorized_cards.push(card)
        end
      end
      categorized_cards
  end

  def count
    @cards.count
  end
end
