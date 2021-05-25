module Players
    class Computer < Player
        def move(board)
            # binding.pry
            if !board.full?
                #binding.pry
                best_move(board)
            end
        end

        def best_move(board)
            if board.cells.empty?
                binding.pry
                return "4"
            elsif board.turn_count == 1
                return "0"
            elsif board.turn_count == 2
                return "6"
            elsif board.turn_count == 3
                return "2"
            elsif board.turn_count == 4
                return "1"
            elsif board.turn_count == 5
                return "7"
            elsif board.turn_count == 6
                return "5"
            elsif board.turn_count == 7
                return "3"
            else 
                return "8"
            end
        end
    end
end