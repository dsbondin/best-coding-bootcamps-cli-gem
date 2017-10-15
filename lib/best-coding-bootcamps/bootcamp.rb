require_relative "../best-coding-bootcamps"

class BestCodingBootcamps::Bootcamp

  attr_accessor :name, :url, :ranking, :about, :courses, :cost, :hiring_rate
  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_bootcamps
    main = Nokogiri::HTML(open("https://www.switchup.org/locations/nyc-coding-bootcamp"))
    bootcamps = main.search("div h3 a")[0..19]
    bootcamps.each do |b|
      self.new(b.text.split(". ")[1], "https://www.switchup.org#{b.attribute("href")}")
    end
  end

  def ranking
    Nokogiri::HTML(open(self.url)).search("div.bootcamp-caption p span span").text
  end

  def about
    Nokogiri::HTML(open(self.url)).search("blockquote#topic-description p").text
  end

  def courses
    Nokogiri::HTML(open(self.url)).search("a.course-listing").collect do |c|
      c.text
    end
  end

  def cost
    Nokogiri::HTML(open(self.url)).xpath("//*[@id='bootcamp-summary']/table/tbody/tr[8]/td").text
  end

end

BestCodingBootcamps::Bootcamp.create_bootcamps
puts BestCodingBootcamps::Bootcamp.all[2].cost
