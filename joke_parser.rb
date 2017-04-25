require 'nokogiri'

def laffy_taffy_parser
  doc = Nokogiri::HTML(File.open('laffy_taffy.html'))

  doc.search('ol > li').map do |element|
    puts element.inner_text.strip
  end
end

def chartcons_parser
  doc = Nokogiri::HTML(File.open('chartcons-jokes.html'))
  doc.search('.wp-content > p').map do |element|
    puts element.inner_text.strip
  end
end

chartcons_parser
