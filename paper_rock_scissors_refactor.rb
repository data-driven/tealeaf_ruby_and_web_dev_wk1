# Tealeaf Academy Week 1 Assignment
# Paper, Rock, Scissors Game

CHOICES = { 'P' => 'Paper', 'R' => 'Rock', 'S' => 'Scissors' }

def display_winning_message(selection)
  if selection == 'P'
    puts "Paper wraps Rock."
  elsif selection == 'R'
    puts "Rock smashes Scissors."
  elsif selection == "S"
    puts "Scissors cut Paper."
  end
end

puts 'Play Paper Rock Scissors'

loop do
  begin 
    puts 'Choose one: (P/R/S)'
    player_selection = gets.chomp.upcase
  end until CHOICES.keys.include?(player_selection)

  computer_selection = CHOICES.keys.sample

  puts "You picked #{CHOICES[player_selection]} and the computer chose #{CHOICES[computer_selection]}."

  if player_selection == computer_selection
    puts 'It\'s a tie!'
  elsif (player_selection == 'P' && computer_selection == 'R') || \
        (player_selection == 'R' && computer_selection == 'S') || \
        (player_selection == 'S' && computer_selection == 'P')
    display_winning_message(player_selection)
    puts 'You win!'
  else
    display_winning_message(computer_selection)
    puts 'You lose!'
  end

  begin
    puts 'Would you like to play again? Y or N'
    response = gets.chomp.upcase
  end until response == 'Y' or response == 'N'
  break if response == 'N'
end

puts 'Thanks for playing.'
