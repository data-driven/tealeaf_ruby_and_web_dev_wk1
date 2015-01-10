# Asssignment from Tealeaf Academy Introduction to Ruby
# and Web Development Week 1

def say(message)
  puts "=> #{message}"
end

puts 'This calculator will perform a mathematical operation on two numbers.'

loop do
  puts 'Please enter your first number.'
  number_1 = gets.chomp
  while  number_1 != number_1.to_i.to_s
    say 'Please be sure to enter a number.'
    number_1 = gets.chomp
  end

  puts 'Now enter your second number.'
  number_2 = gets.chomp
  while  number_2 != number_2.to_i.to_s
    say 'Please be sure to enter a number.'
    number_2 = gets.chomp
  end

  puts 'Enter the number for the operation you would like to perform.'
  puts '1) Add 2) Subtract 3) Multiply 4) Divide'
  operation = gets.chomp
  while  (operation.to_i != 1 && operation.to_i != 2 && operation.to_i != 3 \
  && operation.to_i != 4) || (operation != operation.to_i.to_s)
    say 'Please be sure to enter a number 1-4.'
    operation = gets.chomp
  end

  puts "Your numbers are #{number_1} and #{number_2}."
  puts "You have selected operation #{operation}."

  case operation
  when '1'
    say "The result of #{number_1} + #{number_2} is #{(number_1.to_f + number_2.to_f).round(4)}"
  when '2'
    say "The result of #{number_1} - #{number_2} is #{(number_1.to_f - number_2.to_f).round(4)}"
  when '3'
    say "The product of #{number_1} * #{number_2} is #{(number_1.to_f * number_2.to_f).round(4)}"
  else
    while number_2.to_i == 0
      say 'You can\'t divide by zero. Please enter a non-zero value for your second number.'
      number_2 = gets.chomp
    end
    say "The result of #{number_1} / #{number_2} is #{(number_1.to_f / number_2.to_f).round(4)}"
  end

  puts 'Would you like to perform another calculation? Y or N'
  answer = gets.chomp

  break if answer.upcase == 'N'
end
puts 'See you next time!'
