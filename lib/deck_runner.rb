require 'pry'
require './card'
require './deck'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surfaace of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise form due north?", "North north west", :STEM)


cards = [card_1, card_2, card_3]

deck = Deck.new(cards)

p deck.cards


p deck.count

p deck.cards_in_category(:STEM)

p deck.cards_in_category(:Geography)

p deck.cards_in_category("Pop Culture")
