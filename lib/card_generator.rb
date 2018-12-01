require './lib/card'
require 'pry'

class CardGenerator
  attr_reader :cards

  def initialize(filename)
    @card_text = []
    @cards = []

    File.readlines(filename).each do |line|
      @card_text << line.chomp.split(',')
    end

    @card_text.each do |card|
      @cards << Card.new(card[0], card[1], card[2])
    end
  end
end
