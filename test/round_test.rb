require 'minitest/autorun'
require './lib/card'
require './lib/round'
require './lib/turn'
require './lib/deck'

class RoundTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_instance_of Round, round

  end

  def test_current_card
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_equal card_1, round.current_card

  end

  def test_current_card_changes
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.take_turn('')

    assert_equal card_2, round.current_card
  end

  def test_turns_are_stored
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    turn = round.take_turn('')

    assert_equal [turn], round.turns
  end

  def test_number_correct
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.take_turn('Juneau')

    assert_equal 1, round.number_correct
  end

  def test_zero_correct
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.take_turn('')
    p round.number_correct

    assert_equal 0, round.number_correct
  end

  def test_correct_by_category
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.take_turn('Juneau')

    assert_equal 1, round.number_correct_by_category(:Geography)
  end

  def test_zero_correct_by_category
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.take_turn('Juneau')

    assert_equal 0, round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    card_4 = Card.new('1 - 1?', '0', :STEM)
    deck = Deck.new([card_1, card_2, card_3, card_4])
    round = Round.new(deck)
    round.take_turn('Juneau')
    round.take_turn('Mars')
    round.take_turn('')
    round.take_turn('0')

    assert_equal 75.0, round.percent_correct
  end

  def test_zero_percent_correct
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.take_turn('')

    assert_equal 0.0, round.percent_correct
  end

  def test_percent_correct_by_category
    card_1 = Card.new('What is 1 + 1?', '2', :STEM)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    card_4 = Card.new('1 - 1?', '0', :STEM)
    deck = Deck.new([card_1, card_2, card_3, card_4])
    round = Round.new(deck)
    round.take_turn('Juneau')
    round.take_turn('Mars')
    round.take_turn('')
    round.take_turn('')

    assert_equal 25.0, round.percent_correct_by_category(:STEM)
  end

  def test_zero_percent_correct_by_category
    card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.take_turn('')

    assert_equal 0.0, round.percent_correct_by_category(:Geography)
  end

end
