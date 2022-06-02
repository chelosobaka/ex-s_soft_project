file = File.open("06.txt")
file = file.readlines.each{|line| line.chomp!}

@array = Array.new(1000) { Array.new(1000) { "0" } }

def toggle(cor1, cor2)
  i1 = cor1[0]
  j1 = cor1[1] 
  i2 = cor2[0] 
  j2 = cor2[1]

  (i1..i2).each do |i|
    (j1..j2).each do |j|
      if @array[i][j] == "0"
        @array[i][j] = "1"
      else
        @array[i][j] = "0"
      end
    end
  end
end

def turn_on(cor1, cor2)
  i1 = cor1[0]
  j1 = cor1[1] 
  i2 = cor2[0] 
  j2 = cor2[1]

  (i1..i2).each do |i|
    (j1..j2).each do |j|
        @array[i][j] = "1"
    end
  end
end

def turn_off(cor1, cor2)
  i1 = cor1[0]
  j1 = cor1[1] 
  i2 = cor2[0] 
  j2 = cor2[1]

  (i1..i2).each do |i|
    (j1..j2).each do |j|
        @array[i][j] = "0"
    end
  end
end


file.each do |line|
  arr = line.split(" ")
  if arr.size == 4
    toggle(arr[1].split(",").map(&:to_i), arr[3].split(",").map(&:to_i))
  else 
    if arr[1] == "on"
      turn_on(arr[2].split(",").map(&:to_i), arr[4].split(",").map(&:to_i))
    elsif arr[1] == "off"
      turn_off(arr[2].split(",").map(&:to_i), arr[4].split(",").map(&:to_i))
    end
  end
end

arr = 0
@array.each do |array|
  arr += array.select { |element| element == "1" }.count
end

puts arr