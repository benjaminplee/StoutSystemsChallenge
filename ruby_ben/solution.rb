lines = []

File.open('../input.txt').each { |line| lines << line }  

lines = lines[1..lines.size].
              map     { |line| line.split("\t") }.
              each    { |line| line[1] = line[1].gsub(/[^a-zA-Z]/, '').reverse }.
              reject  { |line| line[1].to_s.empty? }.
              sort    { |x, y| (x[1] <=> y[1]) == 0 ? (x[5].to_f <=> y[5].to_f) : (x[1] <=> y[1]) }.
              collect { |line| line.join("\t") }.
              insert(0, lines[0])

File.open("output.txt", 'w') { |f| f.write(lines) }
