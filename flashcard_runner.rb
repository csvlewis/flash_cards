require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'


card_1 = Card.new("What is the average flight speed of an unladen swallow?", "african or european?", :Zoology)
card_2 = Card.new("What is the name of the coffe shop from the sitcom 'Friends'?", "central perk", :TV_and_movies)
card_3 = Card.new("What is the largest country located entirely in Europe?", "ukraine", :Geography)
card_4 = Card.new("What is the most populous city in the world?", "tokyo", :Geography)
card_5 = Card.new("Which African country has the most pyramids?", "sudan", :Geography)
card_6 = Card.new("Which animal has the highest blood pressure?", "giraffe", :Zoology)
card_7 = Card.new("What is the only mammal capable of flight?", "bat", :Zoology)
card_8 = Card.new("In which year were the Academy Awards first presented?", "1929", :TV_and_movies)
card_9 = Card.new("What was the first feature film to have a sequel?", "king kong", :TV_and_movies)
card_10 = Card.new("Which Oscar award-winning film was released with an X rating?", "midnight cowboy", :TV_and_movies)
cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10]

deck = Deck.new(cards)
round = Round.new(deck)

round.start
