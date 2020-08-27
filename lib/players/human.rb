require 'pry'
module Players
  class Human < Player
  
    def move(input)
      puts"What is your move?"
      gets.chomp
    end
  
  end
end