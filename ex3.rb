class Lock 
  def initialize
    @array = [
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, "1", nil, nil, nil],
      [nil, nil, "2", "3", "4", nil, nil],
      [nil, "5", "6", "7", "8", "9", nil],
      [nil, nil, "A", "B", "C", nil, nil],
      [nil, nil, nil, "D", nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil]
    ]
    @i_position = 3
    @j_position = 1
  end
  
  attr_reader :i_position, :j_position
  
  def instruction(string)
    array_buttons = []
    array_buttons << @array[@i_position][@j_position]
    string.each_char do |chr|
      result = key(chr)
      !result.nil? ? array_buttons << result : next
    end
    array_buttons.last
  end
  
  def key(symb)
    if symb == "U"
      up()
    elsif symb == "D"
      down()
    elsif symb == "L"
      left()
    elsif symb == "R"
      right()
    end
  end
  
  def up()
    i = @i_position
    j = @j_position
    if can_move?(@array[i-1][j])
      @i_position -= 1 
      return @array[i-1][j]
    end
  end

  def down()
    i = @i_position
    j = @j_position
    if can_move?(@array[i+1][j])
      @i_position += 1 
      return @array[i+1][j]
    end
  end

  def left()
    i = @i_position
    j = @j_position
    if can_move?(@array[i][j-1])
      @j_position -= 1 
      return @array[i][j-1]
    end
  end

  def right()
    i = @i_position
    j = @j_position
    if can_move?(@array[i][j+1])
      @j_position += 1 
      return @array[i][j+1]
    end
  end

  def can_move?(el)#элемент на который нужно походить
    !el.nil?
  end
end

code = []
file = File.open("02.txt")
file = file.readlines.each{|line| line.chomp!}

new_lock = Lock.new
file.each do |string|
  result = new_lock.instruction(string)
  !result.nil? ? code << result : next

end

p code