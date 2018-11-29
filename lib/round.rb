require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :turns,
              :deck

  def initialize(deck)
  @deck = deck
  @turns = []
  end

  def current_card
  @deck.cards[0]
  end

  def take_turn(guess)
  new_turn = Turn.new(guess, current_card)
  @turns << new_turn
  @deck.cards.shift
  return new_turn
  end

  def number_correct
    correct = 0
  @turns.each do |turn|
    if turn.correct?
      correct += 1
      return correct
    end
  end
  end

  def number_correct_by_category(category)
    correct = 0
  @turns.each do |turn|
    if turn.card.category == category
    if turn.correct?
      correct += 1
    end
    end
  end
    return correct
  end

  def percent_correct
    correct = 0.0
    total = @turns.count
    @turns.each do |turn|
      if turn.correct?
        correct += 1
      end
    end
    percent = (correct / total) * 100.0
    return percent
  end

  def percent_correct_by_category(category)
    correct = 0.0
    total = 0.0
    @turns.each do |turn|
      if turn.card.category == category
        total += 1
      end
    end
    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        correct += 1
      end
    end
    percent = (correct / total) * 100.0
    return percent
  end
end
