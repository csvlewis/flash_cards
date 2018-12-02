class Round
  attr_reader :deck,
              :turns
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
    correct = @turns.find_all do |turn|
      turn.correct?
    end
    correct.count
  end

  def number_correct_by_category(category)
    turn_category = @turns.find_all do |turn|
      turn.card.category == category
    end
    turn_category.count
  end

  def percent_correct
    total = @turns.count
    correct = @turns.find_all do |turn|
      turn.correct?
    end
    (correct.count.to_f / total.to_f) * 100.0
  end

  def percent_correct_by_category(category)
    total = @turns.find_all do |turn|
      turn.card.category == category
    end
    correct = @turns.find_all do |turn|
      turn.card.category == category && turn.correct?
    end
    percent = (correct.count.to_f / total.count.to_f) * 100.0
    return percent
  end

  def start
    starting_cards = @deck.count
    puts "Welcome! You're playing with #{starting_cards} cards."
    puts '-' * 40
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
    puts "TV and movies - #{percent_correct_by_category('TV_and_movies')}% correct"
    puts "Zoology - #{percent_correct_by_category('Zoology')}% correct"
    puts "Geography - #{percent_correct_by_category('Geography')}% correct"
  end
end
