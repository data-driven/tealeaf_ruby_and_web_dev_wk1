# Asssignment from Tealeaf Academy Introduction to Ruby
# and Web Development Week 1

def say(msg)
  puts "=> #{msg}"
end

puts "This calculator will perform a mathematical operation on two numbers."

begin
  puts "Please enter your first number."
  num1 = gets.chomp

  puts "Now enter your second number."
  num2 = gets.chomp

  puts "Enter the number for the operation would you like to perform"
  puts "1) Add 2) Subtract 3) Multiply 4) Divide"
  operation = gets.chomp

  puts "Your numbers are #{num1} and #{num2}. You have selected operation #{operation}."

  case operation
  when "1"
    say "The result of #{num1} + #{num2} is #{num1.to_f + num2.to_f}"
  when "2"
    say "The result of #{num1} - #{num2} is #{num1.to_f - num2.to_f}"
  when "3"
    say "The product of #{num1} * #{num2} is #{num1.to_f * num2.to_f}"
  when "4"
    say "The result of #{num1} / #{num2} is #{num1.to_f / num2.to_f}"
  else
    say "Please try again and be sure to enter a number 1 - 4."
  end

  puts "Would you like to perform another calculation? Y or N"
  answer = gets.chomp.upcase

end while answer == "Y"

puts "See you next time!"