class TicTacToe
  def initialize(board= nil)
    @board = board || Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(indx, ltr="X")
    indx = input_to_index(indx)
    @board[indx]=ltr
  end

  def input_to_index(x)
    a=x.to_i
    a=a-1
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?("0","8")
      a = input_to_index(index.to_i)
      if a.between?(0,8) && !(position_taken?(a))
        true
      else
        false
      end
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    if !valid_move?(index)
      turn
    end
    move(index, current_player)
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |a|
      if !(a == "" || a == nil || a == " ")
        counter += 1
      end
    end
    counter
  end

  def current_player
    a = turn_count
    b = a % 2 == 0 ? "X" : "O"
    b
  end

  def won?
    if (@board.all? {|i| i == "" || i ==" "})
      false
    else
      WIN_COMBINATIONS.detect do |x|
        (@board[x[0]] == "X" && @board[x[1]] == "X" && @board[x[2]] == "X") || (@board[x[0]] == "O" && @board[x[1]] == "O" && @board[x[2]] == "O")
      end
    end

  end

  def full?
    @board.all? do |code|
      (code == "X" || code == "O")
    end
  end

  def draw?
    !(won?) && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
     a = won?
     @board[a[0]]
   end
  end

  def play
    while !(over?)
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end

  end

end

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
