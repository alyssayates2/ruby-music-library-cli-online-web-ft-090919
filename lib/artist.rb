require "concerns/findable.rb"
class Artist
extend Concerns::Findable
attr_accessor :name
attr_reader :songs

@@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
   artist.save
   artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end

    if !@songs.include?(song)
      @songs << song
    end
  end

  def genres
    songs.collect(&:genre).uniq
  end

end
