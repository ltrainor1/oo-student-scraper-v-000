require 'open-uri'
require 'pry'

class Scraper

  attr_accessor :name, :location, :bio_url

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = doc.css('.student-card')
    student_array = []
    students.each do |student|
      @name = student.css("h4").text
      @location = student.css("p").text
      @bio_url = student.css("@href").first.value
      student_array << {:name=>@name,:location=>@location,:profile_url=>@bio_url}
    end
    student_array
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    quote = doc.css('.profile_quote')
    links = doc.css('.social-icon @src').first.value
    binding.pry
  end

end
