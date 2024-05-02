require 'yaml'
require 'time'

# remove all files from the saner folder
Dir.glob('saner/*').each do |filename|
  File.delete(filename)
end

Dir.glob('_posts/*.md').each do |filename|
  File.open(filename, 'r') do |file|
    # only process files starting with 2014 - 2024
    next unless filename =~ /\A(201[4-9]|202[0-4])/
    content = file.read
    # get YAML front matter
    front_matter = content[/\A---\r?\n(.*?)\r?\n---\r?\n/m, 1]
    if front_matter
      front_matter.gsub!(/date: (\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2})( [^'"]*)?['"]?/) do |match|
        date = $1
        "date: '#{date} GMT-5'" # represent date as a string and add a timezone
      end
      # wrap in try/catch to handle invalid YAML
      begin
        yaml_data = YAML.safe_load(front_matter)
        # Now you can access the YAML data. For example:
        # puts yaml_data['title']
      rescue => e
        puts "Error parsing YAML front matter in #{filename}: #{e}"
        puts "Front matter:"
        puts front_matter
      end

      # remove YAML front matter
      content.sub!(/\A---\r?\n(.*?)\r?\n---\r?\n/m, '')
      # write back to new file
      begin
        File.open("saner/#{yaml_data['title'].gsub(/[ \/]/, " ")}.md", 'w') do |new_file|
          # put formatted date at the top
          unless (yaml_data['date'].nil?)
            new_file.write(Time.parse(yaml_data['date']).strftime("%B %d, %Y") + "\n\n")
          else
            puts "No date found for #{filename}"
          end
          new_file.write(content)
        end
      rescue => e
        puts "Error writing new file for #{filename}: #{e}"
        puts "YAML data:"
        puts yaml_data
      end
    end
  end
end
