@position = [0, 0]
file = File.open("01.txt")
array = file.read.chomp.split(", ")
p array
@comp_array = [:N, :E, :S, :W]

def compas(direction)
  if direction == "L"
    @comp_array.rotate!(-1)
  elsif direction == "R"
    @comp_array.rotate!(1)
  end
  @comp_array[0]
end
     
array.each do |el|
  direction = el[0]
  distance = el.scan(/\d/).join('').to_i   
  compas_result = compas(direction)
  p el
if compas_result == :N
  p "Направление n"
  @position[1] += distance 
elsif compas_result == :E
  p "Направление e"
  @position[0] += distance 
elsif compas_result == :S
  p "Направление s"
  @position[1] -= distance 
elsif compas_result == :W
  p "Направление w"
  @position[0] -= distance 
end
  p @comp_array
  p "Текущая позиция #{@position}"
p "------------------------------"
end


