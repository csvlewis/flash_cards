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
    @card_category.clear
    cards.each do |card|
      if card.category == category
        @card_category << card
      end
    end
    return @card_category
  end
end
