file = File.open("05.txt")
file = file.read.chomp
@size_before = file.size 
@size_after = nil

while @size_after != @size_before do
  @size_before = file.size
  i = 0
  begin 
    if (file[i].downcase == file[i+1].downcase) && (file[i] != file[i+1])
      file.slice!(i+1)
      file.slice!(i)
      @size_after = file.size
    else 
      i+=1
    end while i <= (file.size - 2)
  end
end

p file.length
