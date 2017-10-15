class BestCodingBootcamps::Bootcamps

  attr_accessor :name, :about, :url, :courses, :cost_ranking, hiring_rate
  @@all = []

  def initialize(bootcamp_hash)

    all << self
  end

  def self.all
    @all
  end



end
