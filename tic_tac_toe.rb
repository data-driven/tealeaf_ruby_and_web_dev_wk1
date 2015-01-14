piece_placement = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }

def check_winner(piece_placement)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if piece_placement.values_at(*line).count('X') == 3
    return "Computer" if piece_placement.values_at(*line).count('O') == 3
  end
  nil
end

loop do
  system 'clear'

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
  if check_winner(piece_placement) == 'Player'
    puts "We have a winner! X takes the game." 
    break
  end

  # computer_selection -- random
  computer_selection = piece_placement.select { |k,v| v == ' ' }.to_a.sample(1).flatten[0]
  piece_placement[computer_selection] = 'O'
  if check_winner(piece_placement) == 'Computer'
    puts "We have a winner! O takes the game." 
    break
  end
end