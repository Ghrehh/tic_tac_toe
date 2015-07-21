require "rubygems"
require "gosu"
include Gosu
require_relative "ttt.rb"


class DemoWindow < Gosu::Window
	attr_accessor :font, :game, :board, :game, :image, :x_image, :o_image

	def initialize
		super(640,400,false)
		self.caption = "Tic Tac Toe"
		@font = Gosu::Font.new(20)
		@x_image = Gosu::Image.new("images/x.png")
		@o_image = Gosu::Image.new("images/o.png")
		@image = nil
		@game = Game.new
		@board = @game.board.board
	end


	def update
		if button_down? Kb1
			@game.turn 1
		end

		if button_down? Kb2
			@game.turn 2
		end

		if button_down? Kb3
			@game.turn 3
		end

		if button_down? Kb4
			@game.turn 4
		end

		if button_down? Kb5
			@game.turn 5
		end

		if button_down? Kb6
			@game.turn 6
		end

		if button_down? Kb7
			@game.turn 7
		end

		if button_down? Kb8
			@game.turn 8
		end

		if button_down? Kb9
			@game.turn 9
		end
	end


	def draw
		#board 1
		if @board[0] == "x"
			@x_image.draw_rot(245, 58, 1, 0, 0.5, 0.5, 0.2, 0.2)
		elsif @board[0] == "o"
			@o_image.draw_rot(245, 58, 1, 0, 0.5, 0.5, 0.1, 0.1)
		elsif @board[0] == "-"
			@image = nil
		end

		#board 2
		if @board[1] == "x"
			@x_image.draw_rot(350, 58, 1, 0, 0.5, 0.5, 0.2, 0.2)
		elsif @board[1] == "o"
			@o_image.draw_rot(350, 58, 1, 0, 0.5, 0.5, 0.1, 0.1)
		end

		#board 3
		if @board[2] == "x"
			@x_image.draw_rot(450, 58, 1, 0, 0.5, 0.5, 0.2, 0.2)
		elsif @board[2] == "o"
			@o_image.draw_rot(450, 58, 1, 0, 0.5, 0.5, 0.1, 0.1)
		end

		#board 4
		if @board[3] == "x"
			@x_image.draw_rot(245, 158, 1, 0, 0.5, 0.5, 0.2, 0.2)
		elsif @board[3] == "o"
			@o_image.draw_rot(245, 158, 1, 0, 0.5, 0.5, 0.1, 0.1)
		end

		#board 5
		if @board[4] == "x"
			@x_image.draw_rot(350, 158, 1, 0, 0.5, 0.5, 0.2, 0.2)
		elsif @board[4] == "o"
			@o_image.draw_rot(350, 158, 1, 0, 0.5, 0.5, 0.1, 0.1)
		end

		#board 6
		if @board[5] == "x"
			@x_image.draw_rot(450, 158, 1, 0, 0.5, 0.5, 0.2, 0.2)
		elsif @board[5] == "o"
			@o_image.draw_rot(450, 158, 1, 0, 0.5, 0.5, 0.1, 0.1)
		end

		#board 7
		if @board[6] == "x"
			@x_image.draw_rot(245, 258, 1, 0, 0.5, 0.5, 0.2, 0.2)
		elsif @board[6] == "o"
			@o_image.draw_rot(245, 258, 1, 0, 0.5, 0.5, 0.1, 0.1)
		end

		#board 8
		if @board[7] == "x"
			@x_image.draw_rot(350, 258, 1, 0, 0.5, 0.5, 0.2, 0.2)
		elsif @board[7] == "o"
			@o_image.draw_rot(350, 258, 1, 0, 0.5, 0.5, 0.1, 0.1)
		end

		#board 9
		if @board[8] == "x"
			@x_image.draw_rot(450, 258, 1, 0, 0.5, 0.5, 0.2, 0.2)
		elsif @board[8] == "o"
			@o_image.draw_rot(450, 258, 1, 0, 0.5, 0.5, 0.1, 0.1)
		end


		#grod
		draw_line(300, 20,0xFF7F7F00, 300, 300,0xFF7F7F00)
		draw_line(400, 20,0xFF7F7F00, 400, 300,0xFF7F7F00)

		draw_line(210, 100,0xFF7F7F00, 500, 100,0xFF7F7F00)
		draw_line(210, 200,0xFF7F7F00, 500, 200,0xFF7F7F00)


		#text
		if @game.winner
			@font.draw("#{@game.winner.name} wins!", 10, 10, 10, 1.0, 1.0, 0xff_ffff00)
		else
			@font.draw("turn: #{@game.current_player.name}", 10, 10, 10, 1.0, 1.0, 0xff_ffff00)
		end
		
		@font.draw("Press a key 1-9 to take your turn.", 10, 360, 10, 1.0, 1.0, 0xff_ffff00)
	end

	def button_down(id)
		if id == Gosu::KbEscape
		  close
		end
	end
end

DemoWindow.new.show

#1. 145, 58
#2. 250, 58
#3. 350, 58
#4. 145, 158
#5. 250, 158
#6. 250, 158
#7. 145, 258
#8. 250, 258
#9. 250, 258

