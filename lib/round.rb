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
    end
    end
      return correct
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

  def start
    starting_cards = @deck.count
    puts "Welcome! You're playing with #{starting_cards} cards."
    puts "-" * 40
    round = 1
    past_turns = []
    while @deck.cards.count > 0
      puts "This is card number #{round} out of #{starting_cards}"
      puts "Question: #{@deck.cards[0].question}"
      response = gets.chomp.to_s.downcase
      take_turn(response).feedback
      turn = Turn.new(response, @deck.cards[0])
      past_turns << turn
      round += 1
    end
    puts '****** Game over! ******'
    puts "You had #{number_correct} correct guesses out of #{starting_cards} for a total score of #{percent_correct}%."
    puts "TV and movies - #{percent_correct_by_category(:TV_and_movies)}% correct"
    puts "Zoology - #{percent_correct_by_category(:Zoology)}% correct"
    puts "Geography - #{percent_correct_by_category(:Geography)}% correct"
  end
end
#
# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# deck = Deck.new([card_1, card_2, card_3])
# round = Round.new(deck)
