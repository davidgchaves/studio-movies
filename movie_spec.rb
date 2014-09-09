require_relative 'movie'

describe Movie do
  let(:initial_rank) { 10 }

  before { @movie = Movie.new "goonies", initial_rank }

  it "has a capitalized title" do
    expect(@movie.title).to eq "Goonies"
  end

  it "has an initial rank" do
    expect(@movie.rank).to eq 10
  end

  it "has a string representation" do
    expect(@movie.to_s).to eq "Goonies has a rank of 10"
  end

  context "when created without a rank" do
    before { @movie = Movie.new "goonies" }

    it "defaults to a rank of 0" do
      expect(@movie.rank).to eq 0
    end
  end

  context "when given a thumbs up" do
    before { @movie.thumbs_up }

    it "increases rank by 1" do
      expect(@movie.rank).to eq initial_rank + 1
    end
  end

  context "when given a thumbs down" do
    before { @movie.thumbs_down }

    it "decreases rank by 1" do
      expect(@movie.rank).to eq initial_rank - 1
    end
  end
end
