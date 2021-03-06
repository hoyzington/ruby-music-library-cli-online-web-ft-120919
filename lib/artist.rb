class Artist
  
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.create(name)
    self.new(name).tap {|song| song.save}
  end

  def self.destroy_all
    @@all.clear
  end
  
  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song if !@songs.include?(song)
  end
  
  def self.artist_list
    self.all.collect {|artist| artist.name}
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end
  
end