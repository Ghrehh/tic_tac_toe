class Board
	attr_accessor :board, :wins
	def initialize
		@board = Array.new(9, "-")
		@wins = [[1,2,3],[4, 5, 6],[7, 8, 0],[1, 4, 7],[2, 5, 8],[3, 6, 9],[1, 5, 9],[3, 5, 7]]
 	end

	def draw
		puts "\n"
        @board.each_slice(3) { |row| puts row.join(' | ') }
        puts "\n"
	end

	def update choice, sym
		@board[choice - 1] = sym
	end
end



class Player
	attr_accessor :name, :sym, :squares
	def initialize name, sym
		@name = name
		@sym = sym
		@squares = []
	end
end



class Game
	attr_accessor :board, :p1, :p2, :p3, :current_turn, 
				  :winner, :current_player, :check_tile, 
				  :user_choice, :error_message
	def initialize
		@board = Board.new
		@p1 = Player.new "Player 1", "x"
		@p2 = Player.new "Player 2", "o"
		@p3 = Player.new "No one", "P"
		@current_turn = 1
		@winner = nil
		@current_player = nil
		@current_turn.odd? ? @current_player = @p1 : @current_player = @p2
		@check_tile = false
		
		@error_message = ""
	end


	def play
		#turn until @winner

		#puts "\n" + "#{@winner.name} wins!"
		#@board.draw
	end


	def turn x
		@error_message = ""

		@check_tile = false
			
		@current_turn.odd? ? @current_player = @p1 : @current_player = @p2

		check_valid x


		if @check_tile

			@current_player.squares << x

			@board.update x, @current_player.sym

			game_over?

			@current_turn +=1

			@error_message = ""


		end
	end


	def check_valid tile
		if !(p1.squares.include? tile) 
			if !(p2.squares.include? tile)
				if tile.between?(1, 9)
					@check_tile = true
				end
			end
		else
			@error_message = "That's not a valid tile"
		end
	end


	def game_over?
		@board.wins.each do |x|
			if @current_player.squares.include? x[0]
				if @current_player.squares.include? x[1]
					if @current_player.squares.include? x[2]
						@winner = @current_player
					end
				end
			end

		end
		@winner = @p3 if @current_turn == 9
	end


end

#g = Game.new
#g.play