#re-assigning the variable to something else
x = 4

loop do
  x = 'hey there'
  break
end

puts x # => what's x?
puts "x is 'hey there' the variable was created outside of the do loop."

#call a method that doesn’t mutate the caller
puts

def no_mutate(arr)
  arr.uniq
end

my_arr = [1, 2, 2, 3]
no_mutate(my_arr)
puts my_arr # => what’s the output?

puts "The output will be the original array since uniq"
puts "doesn't mutate without the bang."

#call a method that mutates the caller.
def yes_mutate(arr)
  arr.uniq!
end

my_arr = [1, 2, 2, 3]
yes_mutate(my_arr)
puts my_arr # => what’s the output?

puts
puts "The output will be 1, 2, 3 because uniq! mutates the caller."

#Create a local variable at an inner scope and try to reference it 
#in the outer scope. What happens when you have nested do/end blocks? 
#Perform similar code experiments as outlined in #1. 
#Make sure to take your time to play around with different scenarios here.

#the commented out code does not run because y is created in the block
#1.times { y = 400 }
#puts y

puts

while true
  y = 300
  break
end
puts y
puts "Y can be output here because it was created outside of a do/end or"
puts "curly braces that follow a method call."

puts

loop do
  y = 'hey there'
  break
end
puts y
puts "Y can be output here because it was created outside of a do/end"
puts "that follows a method call."
puts

1.times do 
    height = 72
    1.times do
      weight = 165
      puts "Height: from nested do/end: #{height}"
      puts "Weight from nested do/end: #{weight}"
    end
    puts "Height: from outer do/end: #{height}"
    #puts "Weight from outer do/end: #{weight}" 
    #line above fails because the variable is out of scope
  end

#How does variable scope rules pertain to methods?
#x = “hi”

#def my_method
  #puts x
#end

#my_method # => what’s the output of invoking the “my_method” method?

puts "An error was created because my_method was passed no value"
puts "and so it considered x to be an undefined variable local to the method."

#A twist on the above
x = "hi"

def my_method(x)
  puts x
  x = "bye"
  puts x
end

my_method(x) # => what’s the output of invoking the “my_method” method?
puts x

