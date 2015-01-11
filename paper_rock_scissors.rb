# Tealeaf Academy Week 1 Assignment
# Paper, Rock, Scissors Game

puts 'Play Paper Rock Scissors'

loop do
  puts 'Choose one: (P/R/S)'
  selection = gets.chomp.upcase

  lookup = { 'P' => 'Paper', 'R' => 'Rock', 'S' => 'Scissors' }

  while selection != 'P' && selection != 'R' && selection != 'S'
    puts 'Please select P, R, or S'
    selection = gets.chomp.upcase
  end

  random_number = rand(1..3)
  case random_number
  when 1
    computer_selection = 'P'
  when 2
    computer_selection = 'R'
  else
    computer_selection = 'S'
  end

  puts "You picked #{lookup[selection]} and the computer chose #{lookup[computer_selection]}."

  if selection == 'P' && computer_selection == 'P' || \
     selection == 'R' && computer_selection == 'R' || \
     selection == 'S' && computer_selection == 'S'
    puts 'It\'s a tie!'
  elsif selection == 'P' && computer_selection == 'R'
    puts 'Paper wraps Rock.'
    puts 'You win!'
  elsif selection == 'P' && computer_selection == 'S'
    puts 'Scissors cut Paper.'
    puts 'You lose!'
  elsif selection == 'R' && computer_selection == 'P'
    puts 'Paper wraps Rock.'
    puts 'You lose!'
  elsif selection == 'R' && computer_selection == 'S'
    puts 'Rock breaks Scissors.'
    puts 'You win!'
  elsif selection == 'S' && computer_selection == 'R'
    puts 'Rock breaks Scissors.'
    puts 'You lose!'
  elsif selection == 'S' && computer_selection == 'P'
    puts 'Scissors cut Paper.'
    puts 'You win!'
  else
    puts 'An error occurred. Please try again.'
  end

  puts 'Would you like to play again? Y or N'
  answer = gets.chomp
  break if answer.upcase == 'N'
end

puts 'Thanks for playing.'
