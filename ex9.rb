class Lock 
  attr_reader :array
  def initialize
=begin
    @array = [
      [".", ".", ".", ".", "."],
      [".", ".", ".", ".", "."],
      [".", ".", ".", ".", "."],
      [".", ".", ".", ".", "."],        
    ]
=end
    @array = Array.new(6) { Array.new(50) { "." } }
  end
  
  def rect(x, y)
    y.times do |y|
      x.times do |x|
        @array[y][x] = "#"  
      end
    end
  end
  
  def rotate_column(x, step)
    @array = @array.transpose
    @array[x].rotate!(-step)
    @array = @array.transpose
  end
  
  def rotate_row(y, step)
    @array[y].rotate!(-step)
  end
end

file = File.open("08.txt")
file = file.readlines.each{|line| line.chomp!}

#p file
lock = Lock.new
file.each do |line|
  line_arr = line.split(" ")
    if line_arr[0] == "rect"
      rect_coord = line_arr[1].split("x")
      lock.rect(rect_coord[0].to_i, rect_coord[1].to_i)
    else
      if line_arr[1] == "row"
        y = line_arr[2].scan(/\d/).join('').to_i
        step = line_arr[4].to_i
        lock.rotate_row(y, step)
      elsif line_arr[1] == "column"
        x = line_arr[2].scan(/\d/).join('').to_i
        step = line_arr[4].to_i
        lock.rotate_column(x, step)
      end
    end
end
p lock.array
#@array.each{|x| p x}
arr = 0
lock.array.each do |array|
  arr += array.select { |element| element == "#" }.count
end

puts arr