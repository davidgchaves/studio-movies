class Movie
  attr_accessor :title
  attr_reader :rank

  def initialize(title, rank=0)
    @title = title.capitalize
    @rank = rank
  end

  def normalized_rank
    @rank / 10
  end

  def thumbs_up
    @rank += 1
  end

  def thumbs_down
    @rank -= 1
  end

  def to_s
    "#{@title} has a normalized rank of #{normalized_rank}"
  end
end

movie1 = Movie.new "goonies", 100
movie1.thumbs_up
puts movie1
movie1.title = "Goonies 2.0"
puts movie1.title
puts movie1.rank
puts movie1.normalized_rank
