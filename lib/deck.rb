require 'pry'
require './lib/card'

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    @card_category = []
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    cards.each do |card|
      if card.category == category
        @card_category << card
      end
    end
    @card_category
  end
end

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
binding.pry
