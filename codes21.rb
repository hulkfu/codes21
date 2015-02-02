#!/usr/bin/env ruby

if ARGV.count != 3
	puts "With the given suffixes merge multiple files code into one file."
	puts "use: ruby codes21.rb /path/to/project rb,js result.txt"
	exit
end

path = ARGV[0]
suffixes = ARGV[1]
output = ARGV[2]

ARGV.each do|a| 
  puts "Argument: #{a}" 
end 

items = []

# get the codes
Dir.glob("#{path}/**/*.{#{suffixes}}").each do |file|
	title = file.split('/').last
	puts file

	puts '*' * 30
	codes = File.read(file)
	codes.squeeze! "\n"
	puts codes

	item = {title: title, codes: codes}
	items << item
end

# write to one file
File.open(output, 'w') do |f|
	items.each do |item|
		f.puts "File:" + item[:title]
		f.puts "Code:"
		f.puts item[:codes]
	end
end

puts "files count:  #{items.size}"