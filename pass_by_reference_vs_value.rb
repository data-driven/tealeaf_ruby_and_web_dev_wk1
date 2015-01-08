=begin
Create a method that takes an array as a parameter. 
Within that method, try calling methods that do not mutate 
the caller. How does that affect the array outside of the method? 
What about when you call a method that mutates the caller within the method?
=end

def my_method(arr)
  arr.uniq
end

my_arr = [1, 2, 2, 3]
my_method(my_arr)
puts my_arr # => was the outer scope array affected by the method invocation?
puts "The outer scope array was not affected."
puts

def sample_method (array)
  puts array.sort
  puts '==== Sorted ===='
  puts array.uniq
  puts '==== Unique ===='
  puts array.shuffle
  puts '==== Shuffled ===='
end

dice_rolls = [2, 3, 4, 7, 7, 9, 12]

sample_method(dice_rolls)

puts '==== Dice Rolls ===='
puts dice_rolls 
puts "Methods that don't mutate have no impact on the calling array"
puts "outside of the method."

puts "Now for an example where the method mutates the caller..."
def my_method(arr)
  arr.uniq!
end

my_arr = [1, 2, 2, 3]
puts "Array before: #{my_arr}"
my_method(my_arr)
puts "Array after: #{my_arr}" # => was the outer scope array affected by the method invocation?
puts "The outer scope array was changed."
