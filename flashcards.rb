puts "Hello. I will quiz you on your Ruby core knowledge. I will give you a definition and you must give me the term it describes."

term_array = []
def_array = []
File.readlines("flashcards.txt").each do |line|
  if line.start_with?("term:")
    term_array << line.chomp
  elsif line.start_with?("def:")
    def_array << line.chomp
  end
end


term_array.each do |value|
  value.gsub!(/term:/, "")
end

def_array.each do |value|
  value.gsub!(/def:/, "")
end

cards = Hash[term_array.zip(def_array)]

cards.each do |key, value|
  puts "\nHere is the definition:\n#{value}\n\n"
  puts "What is the term this definition describes?"
  answer = gets.chomp
  if
    answer == key
    puts "You are correct. Good job. This knowledge will surely be helpful. Keep waxing on little grasshopper.\n"
  else
    answer != key
    puts "Keep studying and you will know this stuff soon enough."
    puts "The correct answer is #{key}."
  end
end
