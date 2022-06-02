file = File.open("02.txt")
array = file.read.split("\n").map{|x| x.split("x")}
sum = 0
array.each do |box|
  box.map!(&:to_i)
  l = box[0]
  w = box[1]
  h = box[2]
  s_min = box.min(2).inject(:*)
  sum += 2*l*w + 2*w*h + 2*h*l + s_min
end

p sum