require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'pry'

class RoundTest < MiniTest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Deck, @round.deck
  end

  def test_turns_starts_empty
    assert_equal [], @round.turns
  end

  def test_it_has_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_if_new_turn_exists
    new_turn = @round.take_turn("Juneau")
    assert_instance_of Turn, new_turn
  end

  def test_if_guess_is_correct
    new_turn = @round.take_turn("Juneau")
    assert new_turn.correct?
  end

  def test_if_round_has_turns
    new_turn = @round.take_turn("Juneau")
    assert_equal new_turn, @round.turns.first
  end

  def test_if_number_correct_has_count
    new_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
  end

  def test_if_current_card_is_next_card
    new_turn = @round.take_turn("Juneau")
    assert_equal @card_2, @round.current_card
  end

  def test_count_in_turns
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 2, @round.turns.count
  end

  def test_if_round_has_feedback
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_if_round_has_percent_correct
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 50, @round.percent_correct
  end

  def test_number_correct_by_category
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_percent_correct_by_category
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 100, @round.percent_correct_by_category(:Geography)
  end

  def test_if_current_card_is_next_card
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal @card_3, @round.current_card
  end
end
