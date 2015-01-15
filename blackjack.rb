puts 'Welcome to Blackjack'
puts 'What is your name?'
player_name = gets.chomp
puts

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'King', 'Queen', 'Ace']
suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']

deck1 = cards.product(suits).shuffle
deck2 = cards.product(suits).shuffle

def deal_card(deck, hand)
  hand.push deck.pop
end

def calculate_score(hand)
  score = 0
  ace_count = 0
  hand.each do |value| 
    case value[0]
    when 2..10
      score += value[0]
    when 'Jack', 'King', 'Queen'
      score += 10
    when 'Ace'
      ace_count += 1
      score += 11
    end
    while score > 21 && ace_count > 0
      score -= 10
      ace_count -= 1
    end
  end
  return score
end

def blackjack?(hand) 
  card_array = []
  hand.each { |card| card_array.push card[0] }
  if card_array.include?('Ace') && ((card_array.include?('Jack')) || (card_array.include?('Queen')) || (card_array.include?('King')))
    return true
  else
    return false
  end
end

def display_player_hand(player_hand)
  puts "Your Hand:" 
  player_hand.each { |value| puts "#{value[0]} of #{value[1]}" }
  puts
end

dealer_hand = []
player_hand = []

puts "Let's get started."
puts

deal_card(deck1, dealer_hand)
deal_card(deck1, dealer_hand)
puts blackjack?(dealer_hand)

puts "Dealer's hand is showing #{dealer_hand[1][0]} of #{dealer_hand[1][1]}."
puts

deal_card(deck1, player_hand)
deal_card(deck1, player_hand)
puts blackjack?(player_hand)

display_player_hand(player_hand)
puts "Your score: #{calculate_score(player_hand)}"

