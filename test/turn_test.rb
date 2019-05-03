require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
    @turn_2 = Turn.new("Seoul", @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_guess
    assert_equal 'Juneau', @turn.guess
  end

  def test_correct?
    assert_equal @turn.guess, @card.answer
  end

  def test_feedback
    assert @turn.correct?, "Correct!"
    refute @turn_2.correct?, "Incorrect."
  end


end
