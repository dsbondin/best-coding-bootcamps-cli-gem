class BestCodingBootcamps::Bootcamp

  attr_accessor :name, :url
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.main_page
    Nokogiri::HTML(open("https://www.switchup.org/locations/nyc-coding-bootcamp"))
  end

  def self.bootcamp_count
    self.main_page.search("div.span9 h2.text-center.blog-post-subtitle").text.gsub(/[^0-9]/, "").to_i
  end

  def self.create_bootcamps
    bootcamp_count =
    self.main_page.search("div h3 a")[0..self.bootcamp_count-1].each do |b|
      bootcamp = self.new
      bootcamp.name = b.text.split(". ")[1]
      bootcamp.url = "https://www.switchup.org#{b.attribute("href")}"
    end
  end

  def doc
    Nokogiri::HTML(open(self.url))
  end

  def ranking
    doc.search("div.bootcamp-caption p span span").text
  end

  def about
    doc.search("blockquote#topic-description p").text
  end

  def website_link
    doc.search("table.topic-info a.website-link").attr("onclick").value.gsub("window.open('", "").split("');")[0]
  end

  def courses
    doc.search("a.course-listing").collect do |c|
      c.text.strip
    end.uniq
  end

  def self.search_for_course(course)
    self.all.select { |school|school.courses.include?(course) }
  end

  def self.find_bootcamp(input)
    self.all[input-1]
  end

end
