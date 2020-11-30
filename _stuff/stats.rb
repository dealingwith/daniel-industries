
@years_hash = Hash.new(0)
words = 0

Dir.glob('*.markdown') do |md_file|
  filename = File.basename md_file, '.markdown'
  year = filename.split('-').first
  # puts year[2..3].to_i
  # years[] += 1
  @years_hash[year[2..3].to_i] += 1
  f = File.read(md_file)
  words = words + f.scan(/[[:alpha:]]+/).count
end

@years_hash.each do |year|
  puts year
end
puts words