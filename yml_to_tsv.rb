require 'yaml'

inputs = YAML.load_file(ARGV[0])

headers = inputs[0].keys
output = ''
headers.each_with_index do |header, index|
  output << "#{header}" + (index == headers.length - 1 ? "\n" : "\t")
end

inputs.each do |input|
  input.each_value do |inp|
    output << "#{inp}" + (inp == input.values.last ? "\n" : "\t")
  end
end

if ARGV[1]
  f = File.new("#{ARGV[1]}", 'w+')
  f.write(output)
else
  puts output
end
