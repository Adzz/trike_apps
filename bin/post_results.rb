#!/usr/local/bin/ruby -w
require_relative '../lib/big_five_results_text_serializer.rb'
require_relative '../lib/big_five_results_poster.rb'

puts "Post no bills"
puts "=============="
puts
puts
puts "Welcome to our Proficient Pleasing Personality Results Poster"
puts "Press Enter to Post.."
gets.chomp
puts "Posting away...!"

hash = BigFiveResultsTextSerializer.new(File.read("spec/fixtures/input_text.txt")).serialize

poster = BigFiveResultsPoster.new(hash)
poster.post

puts "Results posted, Hurrah!"
puts "Your token is: #{poster.token}"
puts "Your Response Code is: #{poster.response_code}"
