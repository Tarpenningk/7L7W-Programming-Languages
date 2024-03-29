class MakeBelieveCSV
def read
	file = File.new('books.txt')
	@headers = file.gets.chomp.split(', ')
	file.each do |row|
	@result << Row.new(headers, row.chomp.split(', '))
	end
end
  
def headers
	@headers
end
  
def csv_contents
	@result
end
  
def initialize
	@result = []
	read
end

def each(&block)
	csv_contents.each do |row|
	block.call row
	end
	end
end

class Row
def header_hash
	@header_hash
end

def csv_contents
	@result
end

def initialize(headers, result)
	header_hash = {};
	headers.each_index do |i|
	header_hash[headers[i]] = i
	end
	@header_hash = header_hash
	@result = result
end

def method_missing name, *args
	csv_contents[header_hash[name.to_s]]
	end
end

class RubyCsv < MakeBelieveCSV
end

puts 'Showing Titles:' 
csv = RubyCsv.new
csv.each {|row| puts row.title}