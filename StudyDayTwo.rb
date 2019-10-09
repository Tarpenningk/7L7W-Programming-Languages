puts 'Each:'
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
index = 0
numbers.each do |i|
index = index + 1
p numbers[(index-4)..(index-1)] if index % 4 == 0 and index > 0
end
puts "\n"
puts 'Each Slice:'
numbers.each_slice(4) {|i| p i}
puts "\n"
puts 'Print File Occucrences:'
x = 1
File.open('names.txt').each_line do |text|
puts "Line Number #{x}: #{text}" if /Carson/x =~ text
x = x + 1
end