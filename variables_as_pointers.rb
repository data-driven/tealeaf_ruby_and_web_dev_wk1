a = 'hi there'
b = a
a.gsub!(' ', '_')
puts "b and a will now be hi_there"
puts b # => what's the output? [SEE ABOVE]
puts a

a = 'hi there'
b = a
a = [1, 2, 3]
puts "b will not change because a and b now point to different"
puts "spaces in memory"
puts b # => what's the output?
puts a

# What’s the difference between the two code examples?
# The first uses a method that mutates the caller while 
# the second just changes the space in memory pointed to by a