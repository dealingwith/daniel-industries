require 'csv'
require 'awesome_print'
require 'date'

data = CSV.read('post_export.csv')

all_content = []

data.each_with_index do |row, index|
  next if index == 0

  date_string = row[6]
  date = DateTime.parse(date_string)
  formatted_date = date.strftime("%B %eth, %Y")

  all_content << {
    :title => row[3],
    :content => row[12],
    :date => formatted_date
  }
end

all_content.sort_by! { |content| content[:date] }

File.open("_drafts/2024-02-14-2023-november-build-club-posts.markdown", "w") do |file|
  file.write <<~HEADER
---
layout: post
title: "2023 November Build Club Posts"
excerpt: 
date: 2024-02-14 14:36:45 -0600
categories: 
---

  HEADER
  all_content.each do |content|
    file.write "## #{content[:title]}\n\n"
    file.write "#### #{content[:date]}\n\n"
    file.write "#{content[:content]}\n\n"
    file.write "---\n\n"
  end
end