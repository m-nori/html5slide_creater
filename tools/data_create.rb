require 'kramdown'

if ARGV.length < 1
  puts "usage: data_create.rb markdown_file"
  exit(-1)
end

input = ARGV[0]
slides = []
slide = nil
code = false
output_file = File.expand_path('../../data/slides.json',  __FILE__)

# read markdown
File.open(input, 'r:utf-8').each do |line|
  if /^\!slide\s?(.*)$/ =~ line
    slides << slide if slide
    slide = {}
    slide[:class] = $1
    slide[:text] = ""
    next
  end
  if code
    if /^\~\~\~.*$/ =~ line
      code = false
      slide[:text] << line
    else
      tmp = line.chomp
      tmp.gsub!(/'/, "&apos;")
      tmp.gsub!(/"/, "&quot;")
      tmp.gsub!(/&/, "&amp;")
      slide[:text] << tmp << "!!br!!\n"
    end
  else
    code = true if /^\~\~\~.*$/ =~ line
    slide[:text] << line
  end
end
slides << slide

# create json
json = File.open(output_file, 'w:utf-8')
json.puts 'var import_slides = '
json.puts '['
slides.each do |slide|
  html = Kramdown::Document.new(slide[:text]).to_html.delete("\r\n")
  html.gsub!(/\!\!br\!\!/, "<br/>")
  if slide[:class] != ""
    html = %|<article class="#{slide[:class]}">#{html}</article>|
  else
    html = %|<article>#{html}</article>|
  end
  json.puts %|  {'slide' : '#{html}'},|
end
json.puts ']'
json.close

