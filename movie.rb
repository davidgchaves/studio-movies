class Movie
  attr_accessor :title
  attr_reader :rank

  def initialize(title, rank=0)
    @title = title.capitalize
    @rank = rank
    @snack_carbs = Hash.new 0
  end

  def each_snack
    @snack_carbs.each { |name, carbs| yield Snack.new name, carbs }
  end

  def carbs_consumed
    @snack_carbs.values.reduce 0, :+
  end

  def ate_snack(snack)
    @snack_carbs[snack.name] += snack.carbs
    puts "#{@title} led to #{snack.carbs} #{snack.name} carbs being consumed."
    puts "#{@title}'s snack: #{@snack_carbs}"
  end

  def hit?
    @rank >= 10
  end

  def status
    hit? ? "Hit" : "Flop"
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

  def <=>(other_movie)
    other_movie.rank <=> @rank
  end

  def self.from_csv(line)
    title, rank = line.split ","
    Movie.new title, Integer(rank)
  end

  def to_csv
    "#{@title},#{@rank}"
  end

  def to_s
    "#{@title} has a rank of #{@rank} (#{status})"
  end
end
