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
    "#{@title} has a rank of #{@rank}"
  end
end

movie1 = Movie.new "goonies", 10
movie2 = Movie.new "ghostbusters", 9
movie3 = Movie.new "goldfinger"

# Two ways: Array.now or []
movies = Array.new

# Two ways: push or <<
movies.push movie1
movies << movie2
movies.push movie3

puts movies

movies.each do |movie|
  movie.thumbs_up
  puts movie
end

puts movies.pop
puts movies.pop
puts movies.pop
