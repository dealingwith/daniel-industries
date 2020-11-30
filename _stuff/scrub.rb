
require 'open-uri'
require 'timeout'
require 'csv'

dead_links = {}
links_count = 0
dead_links_count = 0

Dir.glob('*.markdown') do |rb_file|
  dead_links[rb_file] = []
  f = File.read(rb_file)
  f.scan(/(\(|\[.+\]: )(https?:\/\/\S+[^\]\s\)(\)\W)])/i) { |r|
    links_count += 1
    begin
      Timeout.timeout(5) do
        puts open(r[1]).status
      end
    rescue => e
      next if e.to_s.include? 'redirection forbidden'
      dead_links_count += 1
      dead_links[rb_file] << r[1]
      puts 'dead link: ', r[1]
    end
  }
end

puts 'links:', links_count
puts 'dead links:', dead_links_count

csv = CSV.generate do |csv|
  csv << ['file', *100.times.map { |n| "link#{n+1}" }]
  dead_links.each do |file, links|
    csv << [file, *links] if links.any?
  end
end

File.write 'dealinks.csv', csv
