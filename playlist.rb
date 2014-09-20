require_relative 'movie'
require_relative 'waldorf_and_statler'
require_relative 'snack_bar'

class Playlist
  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies.push movie
  end

  def play(viewings)
    puts "#{@name}'s playlist:"
    puts @movies.sort

    snacks = SnackBar::SNACKS
    puts "\nThere are #{snacks.size} snacks available in the snack bar."
    snacks.each { |s| puts "#{s.name} has #{s.carbs} carbs" }

    1.upto(viewings) do |count|
      puts "\nViewing #{count}:"
      @movies.each do |movie|
        WaldorfAndStatler.review movie
        snack = SnackBar.random
        movie.ate_snack snack
        puts movie
      end
    end
  end

  def total_carbs_consumed
    @movies.reduce(0) { |acc, movie| acc + movie.carbs_consumed }
  end

  def print_stats
    puts "\n#{@name}'s Stats:"

    puts "#{total_carbs_consumed} total carbs consumed"

    @movies.sort.each do |m|
      puts "\n#{m.title}'s snacks totals:"
      m.each_snack { |s| puts "#{s.carbs} total #{s.name} carbs" }
      puts "#{m.carbs_consumed} grand total carbs"
    end

    hits, flops = @movies.partition { |movie| movie.hit? }

    puts "\nHits:"
    puts hits.sort

    puts"\nFlops:"
    puts flops.sort
  end
end
