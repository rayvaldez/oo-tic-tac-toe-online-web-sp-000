class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] ==nil
    return false
  else
    return true
  end
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
      if valid_move?(index) == true
        player_token = current_player
        move(index, player_token)
        display_board
      else
        turn
      end
    end

    def won?
      WIN_COMBINATIONS.each {|combination|
        index_0 = combination[0]
        index_1 = combination[1]
        index_2 = combination[2]

        position_1 = @board[index_0]
        position_2 = @board[index_1]
        position_3 = @board[index_2]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return combination
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return combination
        end
      }
      return false
    end

    def full?
      @board.all? { |index| index == "X" || index == "O"}
    end

end
