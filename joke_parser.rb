require 'nokogiri'
doc = Nokogiri::HTML(File.open('laffy_taffy.html'))

doc.search('ol > li').map do |element|
  puts element.inner_text.strip
end
