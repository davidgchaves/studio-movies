require_relative 'playlist'

describe Playlist do
  before do
    $stdout = StringIO.new      #supress (redirect) the standard output
    @playlist = Playlist.new "Kermit"
  end

  context "being played with one movie" do
    before do
      @initial_rank = 10
      @movie = Movie.new "Goonies", @initial_rank
      @playlist.add_movie @movie
    end

    it "thumbs up the movie if a high number is rolled" do
      allow(WaldorfAndStatler).to receive(:roll_die) { 5 }

      @playlist.play

      expect(@movie.rank).to eq @initial_rank + 1
    end

    it "skips the movie if a medium number is rolled" do
      allow(WaldorfAndStatler).to receive(:roll_die) { 3 }

      @playlist.play

      expect(@movie.rank).to eq @initial_rank
    end

    it "thumbs down the movie if a low number is rolled" do
      allow(WaldorfAndStatler).to receive(:roll_die) { 1 }

      @playlist.play

      expect(@movie.rank).to eq @initial_rank - 1
    end
  end
end
