def initialize_board
  piece_placement = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }
end

def check_winner(piece_placement)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if piece_placement.values_at(*line).count('X') == 3
    return "Computer" if piece_placement.values_at(*line).count('O') == 3
  end
  nil
end

def empty_positions(board)
  board.keys.select { |position| board[position] == ' '}
end

def board_filled?(board)
  empty_positions = board.keys.select { |position| board[position] == ' '}
  if empty_positions == []
    return true
  else
    return false
  end
end

def announce_winner(winner)
  puts "We have a winner! #{winner} takes the game." 
end

def announce_tie
  puts "It's a tie!"
end

def draw_board(piece_placement)
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
end 

board = initialize_board
draw_board(board)

loop do
  begin
    #player selects
    begin
      puts 'Choose a position that has not been taken'
      puts '(from 1 to 9) to place a piece:'
      player_selection = gets.chomp.to_i
    end until empty_positions(board).include?(player_selection)
    board[player_selection] = 'X'
    draw_board(board)
    winner = check_winner(board)
    if winner
      announce_winner('X')
      break
    elsif board_filled?(board)
      announce_tie
    end

    # computer_selection -- random
    computer_selection = board.select { |k,v| v == ' ' }.to_a.sample(1).flatten[0]
    board[computer_selection] = 'O'
    draw_board(board)
    winner = check_winner(board)
    if winner 
      announce_winner('O') 
      break
    elsif board_filled?(board)
      announce_tie
    end
  end until check_winner(board) || board_filled?(board)
  
  begin 
    puts 'Play again? Y or N'
    response = gets.chomp.upcase
  end until response == 'Y' || response == 'N'
  if response == 'N'
    break
  else
    board = initialize_board
    draw_board(board)
  end
end
puts 'Thanks for playing. See you next time.'