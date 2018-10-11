require 'json'
require_relative 'board_printer'
require_relative 'score_card_printer'
require './spy'

board_spaces = JSON.load(File.new(__dir__ + '/data/board_spaces.json'), symbolize_names: true)

board_printer = BoardPrinter.new(board_spaces)

identities = ['French', 'German', 'Spanish', 'Italian', 'American', 'Russian']
spy_items = ['Passwords', 'Disguises', 'Code Books', 'Keys']
score_card_printer = ScoreCardPrinter.new(identities, spy_items)

puts board_printer.to_s
puts
puts score_card_printer.to_s

# Start by gathering the players and their identities
# players = []
new_identities = identities
# spy_ids = Hash.new
score_card = [false, false, false, false]
spy_objects = Hash.new
until new_identities.length == 0
  puts "Enter Player Name"
  input = gets.chomp
  puts "the new player is #{input}"
  rando = new_identities.sample
  puts "Your identity is #{rando}"
  new_identities.delete(rando)
  puts "remaining ids are #{new_identities}"
  spy_single = Spy.new(rando, score_card)
  # spy_ids[input] = rando
  # puts "Spies are #{spy_ids}"
  spy_objects[input] = spy_single
  puts "spy_objects is #{spy_objects}"
end

starting_bank = 10 * spy_objects.length
puts "starting_bank is #{starting_bank}"

spy_objects.each_value { |spy|
  p spy
  spy.bank = starting_bank
  puts "Bank is #{spy.bank}"
}
