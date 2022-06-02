def pascal n
  pascal = []
  row = [1]
  (1...n).each do |i|

      row = ([0] + row).zip(row + [0]).collect { |a, b| a + b }
      pascal << row

  end 
  pascal 
end 

p pascal(1653).flatten.join.size + 1
