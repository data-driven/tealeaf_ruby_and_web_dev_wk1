piece_placement = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }

loop do
  system('clear')

  puts '     |     |     '
  puts "  #{piece_placement[1]}  |  #{piece_placement[2]}  |  #{piece_placement[3]}   "
  puts '     |     |     '
  puts '-----+-----+-----'
  puts '     |     |     '
  puts "  #{piece_placement[4]}  |  #{piece_placement[5]}  |  #{piece_placement[6]}   "
  puts '     |     |     '
  puts '-----+-----+-----'
  puts '     |     |     '
  puts "  #{piece_placement[7]}  |  #{piece_placement[8]}  |  #{piece_placement[9]}   "
  puts '     |     |     '

  puts

  #player selects
  puts 'Choose a position (from 1 to 9) to place a piece:'
  player_selection = gets.chomp.to_i
  piece_placement[player_selection] = 'X'

  # computer_selection -- random
  computer_selection = piece_placement.select { |k,v| v == ' ' }.to_a.sample(1).flatten[0]
  puts computer_selection 
  piece_placement[computer_selection] = 'O'

  # check for winner

end