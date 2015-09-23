inputs = File.read(ARGV[0]).split("\n")
headers = inputs[0].split("\t")
output = "---\n"
inputs[1..-1].each do |record|
  data = record.split("\t")
  output << "- #{headers[0]}: #{data[0]}\n  #{headers[1]}: \'#{data[1]}\'\n"
  output << "  #{headers[2]}: "
  output << (data[2][-1] == ' ' ? "\'#{data[2]}\'\n" : "#{data[2]}\n")
  output << "  #{headers[3]}: #{data[3]}\n  #{headers[4]}: #{data[4]}\n"
  output << "  #{headers[5]}: #{data[5]}\n"
end

output_final = ''
output.each_line do |line|
  if line.length > 80 && line[80..-1].include?(' ')
    line[80..-1] = line[80..-1].split(' ', 2).join("\n    ")
  end
  output_final << line
end

output_final.lines[-1].strip!

if ARGV[1]
  f = File.new("#{ARGV[1]}", 'w+')
  f.write(output_final)
else
  puts output_final
end
