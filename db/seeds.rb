require 'nokogiri'

module JokeParser
  def self.setup
    seed_laffy_taffy
    seed_chartcons
  end

  def self.seed_laffy_taffy
    doc = Nokogiri::HTML(File.open('db/sources/laffy_taffy.html'))

    doc.search('ol > li').map do |element|
      joke = element.inner_text.strip.downcase.capitalize.split("?")
      Joke.create!(question: clean_question(joke), answer: clean_answer(joke))
    end
    puts "Parsed Laffy Taffy joke file"
  end

  def self.seed_chartcons
    doc = Nokogiri::HTML(File.open('db/sources/chartcons-jokes.html'))

    doc.search('.wp-content > p').each_with_index do |element, index|
      next if index == 0
      next if element.first_element_child != nil
      joke = element.inner_text.strip.split("?")
      Joke.create!(question: clean_question(joke), answer: clean_answer(joke))
    end
    puts "Parsed Chartcons file"
  end

  def self.clean_question(joke)
    joke.first.gsub(/^\d+\W\s/, "").concat("?")
  end

  def self.clean_answer(joke)
    joke.last.strip.gsub(/^\W */, "").capitalize
  end
end

Joke.destroy_all
JokeParser.setup
