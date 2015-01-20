system 'clear'

def shuffle_cards
  cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'King', 'Queen', 'Ace']
  suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']

  deck1 = cards.product(suits).shuffle
  game_deck = deck1 
  game_deck
end

def deal_card(deck, hand)
  if deck.length > 0
    hand.push deck.pop
  else
    game_deck = shuffle_cards
    deal_card(game_deck, hand)
  end
end

def calculate_score(hand)
  score = 0
  hand.each do |value| 
    case value[0]
    when 2..10
      score += value[0]
    when 'Jack', 'King', 'Queen'
      score += 10
    when 'Ace'
      score += 11
    end
  end
  hand.select{ |card| card == 'Ace' }.count.times do
    score -= 10 if total > 21
  end
  score
end

def blackjack?(hand) 
  card_array = []
  hand.each { |card| card_array.push card[0] }
  if (card_array.length == 2 && card_array.include?('Ace') && \
     ((card_array.include?('Jack')) || (card_array.include?('Queen')) || \
      (card_array.include?('King'))))
    'BLACKJACK!!!'
  elsif calculate_score(hand) == 21
    'Score of 21!!!'
  else
    nil
  end
end

def display_player_hand(player_hand)
  puts "Your Hand:" 
  player_hand.each { |value| puts "#{value[0]} of #{value[1]}" }
  puts
end

def display_player_score(player_hand)
  puts "Your score: #{calculate_score(player_hand)}"
  puts
end

def display_dealer_hand(dealer_hand)
  puts "Dealer Hand:" 
  dealer_hand.each { |value| puts "#{value[0]} of #{value[1]}" }
  puts
end

def display_dealer_score(dealer_hand)
  puts "Dealer score: #{calculate_score(dealer_hand)}"
  puts
end

def stay_or_hit
  begin
    puts 'Would you like to stay or hit? (Enter S or H)'
    stay_or_hit = gets.chomp.upcase 
    puts "Invalid entry. Please try again" if !['S', 'H'].include?(stay_or_hit)
  end until stay_or_hit == 'S' || stay_or_hit == 'H' 
  stay_or_hit
end

game_deck = shuffle_cards

puts 'Welcome to Blackjack'
puts 'What is your name?'
player_name = gets.chomp
puts

loop do
  dealer_hand = []
  player_hand = []
  system 'clear'

  puts "Let's play."
  puts

  deal_card(game_deck, dealer_hand)
  deal_card(game_deck, dealer_hand)
      
  puts "Dealer's hand is showing #{dealer_hand[1][0]} of #{dealer_hand[1][1]}."
  puts

  deal_card(game_deck, player_hand)
  deal_card(game_deck, player_hand)

  display_player_hand(player_hand)
  display_player_score(player_hand)

  begin

    if blackjack?(player_hand)
      puts "#{blackjack?(player_hand)} #{player_name} wins."
      break
    elsif blackjack?(dealer_hand)
      display_dealer_hand(dealer_hand)
      puts "#{blackjack?(dealer_hand)} Dealer wins."
      break
    end

    player_stay_or_hit = stay_or_hit
    if player_stay_or_hit == 'H' && calculate_score(player_hand) < 21
      system 'clear'
      puts "Dealer's hand is showing #{dealer_hand[1][0]} of #{dealer_hand[1][1]}."
      puts
      deal_card(game_deck, player_hand)
      display_player_hand(player_hand)
      display_player_score(player_hand)
    end
    
    if calculate_score(player_hand) > 21
      puts "#{player_name} busted. Dealer Wins!"
    end
  end until player_stay_or_hit == 'S' || calculate_score(player_hand) > 21

  if player_stay_or_hit == 'S'
    system 'clear'
    display_dealer_hand(dealer_hand)
    display_dealer_score(dealer_hand)
    display_player_score(player_hand)

    begin
      if blackjack?(dealer_hand)
        puts "#{blackjack?(dealer_hand)} Dealer wins."
      elsif (calculate_score(dealer_hand) > calculate_score(player_hand) && \
         calculate_score(dealer_hand) <= 21) 
        puts "Dealer wins with #{calculate_score(dealer_hand)}."
        break
      elsif calculate_score(dealer_hand) == calculate_score(player_hand)
        puts "Dealer takes the tie."
        break
      end

      system 'clear'
      puts 'Dealer hits...'
      puts
      deal_card(game_deck, dealer_hand)
      display_dealer_hand(dealer_hand)
      display_dealer_score(dealer_hand)
      display_player_score(player_hand)
      if calculate_score(dealer_hand) > 21
        puts "Dealer busted. #{player_name} wins!!!"
        break
      elsif blackjack?(dealer_hand)
        puts "#{blackjack?(dealer_hand)} Dealer wins."
        break
      elsif calculate_score(dealer_hand) > calculate_score(player_hand)
        puts "Dealer wins with high score."
        break
      elsif calculate_score(dealer_hand) == calculate_score(player_hand)
        puts "Dealer takes the tie."
        break
      end
    end while calculate_score(dealer_hand) < 17 || \
              (calculate_score(dealer_hand) < calculate_score(player_hand) && \
              calculate_score(player_hand) < 21)
  end

  puts "#{player_name} wins with high score." if calculate_score(player_hand) > calculate_score(dealer_hand) \
  && calculate_score(player_hand) <= 20

  begin
    puts 'Would you like to play again? Y or N'
    response = gets.chomp.upcase
  end until response == 'Y' || response == 'N'
  break if response == 'N'

end

puts "Thanks for playing #{player_name}"
