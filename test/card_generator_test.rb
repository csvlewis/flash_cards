require 'minitest/autorun'
require './lib/card_generator'
require './lib/deck'
require './lib/round'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    cards = CardGenerator.new('cards.txt')

    assert_instance_of CardGenerator, cards
  end

  def test_it_creates_a_deck
    cards = CardGenerator.new('cards.txt')
    deck = Deck.new(cards.cards)

    assert_instance_of Deck, deck
  end

  def test_card_created_from_text_file
    cards = CardGenerator.new('cards.txt')
    deck = Deck.new(cards.cards)

    assert_instance_of Card, deck.cards[0]
    assert_equal 'central perk', deck.cards[1].answer
  end

  def test_it_creates_a_round
    cards = CardGenerator.new('cards.txt')
    deck = Deck.new(cards.cards)
    round = Round.new(deck)

    assert_instance_of Round, round
  end
end
