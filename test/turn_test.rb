require 'minitest/autorun'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    assert_equal 'Juneau', turn.guess
  end

  def test_it_has_a_card
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    assert_equal card, turn.card
  end

  def test_correct_guess
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    assert_equal true, turn.correct?
  end

  def test_incorrect_guess
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Not Juneau', card)

    assert_equal false, turn.correct?
  end

  def test_positive_feedback
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    assert_equal 'Correct!', turn.feedback
  end

  def test_negative_feedback
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Not Juneau', card)

    assert_equal 'Incorrect.', turn.feedback
  end
end
