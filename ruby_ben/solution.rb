output = ""
output2 = []

File.open("../input.txt") do |file|
  header = file.gets
 
  output += header
  
  while(lines = file.gets)
    fields = lines.split("\t")
   
    fields[1] = fields[1].gsub(/[^a-zA-Z]/, '').reverse
   
    output2 << fields if(!fields[1].empty?)
  end
end

output2 = output2.sort do |x, y| 
  first = x[1] <=> y[1]

  if first == 0
    first = x[5].to_f <=> y[5].to_f
  end

  first
end


output2.each { |line| output += line.join("\t") }

File.open("output.txt", 'w') { |f| f.write(output) }