require_relative 'movie'

module Flicks
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
      expect(@movie.to_s).to eq "Goonies has a rank of 10 (Hit)"
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

    context "with 10 or more rank" do
      it "is a hit" do
        expect(@movie.hit?).to be true
      end

      it "has a hit status" do
        expect(@movie.status).to eq "Hit"
      end
    end

    context "with less than 10 rank" do
      before { @movie = Movie.new "goonies", 9 }

      it "is not a hit" do
        expect(@movie.hit?).to be false
      end

      it "has a flop status" do
        expect(@movie.status).to eq "Flop"
      end
    end
  end
end
