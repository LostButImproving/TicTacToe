class TicTacToe

  PLAYER1 = 'X'.freeze

  PLAYER2 = 'O'.freeze

  def initialize(player1 = 'Player 1', player2 = 'Player 2')
    @player1_name = player1
    @player2_name = player2
    @tiles = (1..9).to_a
    @player1_turn = true
    @turncount = 0
    @three_in_a_row = false
    @valid = true
  end

  def game_start
    show_tiles
    while @turncount < 9 && @three_in_a_row == false
      determine_turn ; move ; is_valid?
      if @valid
        place_tile ; increase_turn ; win? ; toggle_turn
      end
      show_tiles
    end
    game_result
  end
  
  private
  
  def determine_turn
    if @player1_turn
      @player = PLAYER1
    else
      @player = PLAYER2
    end
    puts "It is #{@player}'s turn"
  end
  
  
  def show_tiles
    puts "#{@player1_name} is #{PLAYER1} and #{@player2_name} is #{PLAYER2}"
    puts 'Choose your positions using the numbers on the tiles below'
    puts ''
    puts "\t|#{@tiles[0]}\t#{@tiles[1]}\t#{@tiles[2]}|"
    puts "\t|#{@tiles[3]}\t#{@tiles[4]}\t#{@tiles[5]}|"
    puts "\t|#{@tiles[6]}\t#{@tiles[7]}\t#{@tiles[8]}|"
    puts ''
  end

  def move
    puts 'Select a tile player #{@player}'
    @tile = gets.chomp.to_i
  end

  def is_valid?
    if (@tiles[@tile - 1] != 'X' && @tiles[@tile - 1] != 'O') && (1..9).include?(@tile)
     @valid = true
    else
      puts 'Move is invalid'
      @valid = false
  end

  def place_tile
    @tiles[@tile - 1] = @player
  end

  def increase_turn
    @turncount += 1
  end

  def toggle_turn
    @player1_turn = !@player1_turn
  end

  
  def win?
    if @tiles[0] == @player && @tiles[1] == @player && @tiles[2] == @player
      @three_in_a_row = true
    elsif @tiles[3] == @player && @tiles[4] == @player && @tiles[5] == @player
      @three_in_a_row = true
    elsif @tiles[6] == @player && @tiles[7] == @player && @tiles[8] == @player
      @three_in_a_row = true
    elsif @tiles[0] == @player && @tiles[3] == @player && @tiles[6] == @player
      @three_in_a_row = true
    elsif @tiles[1] == @player && @tiles[4] == @player && @tiles[7] == @player
      @three_in_a_row = true
    elsif @tiles[2] == @player && @tiles[5] == @player && @tiles[8] == @player
      @three_in_a_row = true
    elsif @tiles[0] == @player && @tiles[4] == @player && @tiles[8] == @player
      @three_in_a_row = true
    elsif @tiles[2] == @player && @tiles[4] == @player && @tiles[6] == @player
      @three_in_a_row = true
    end
  end

  def game_result
    if @three_in_a_row == true
      puts "#{@player} won"
    else
      puts 'Total stalemate'
    end
  end
end
end

a = TicTacToe.new
a.game_start