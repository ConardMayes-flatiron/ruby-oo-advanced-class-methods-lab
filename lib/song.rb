require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name, artist_name="")
    @name = name
    @artist_name = artist_name
    self.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    Song.new(self)
  end

  def self.new_by_name(song)
    Song.new(song)
  end

  def self.create_by_name(name)
    Song.new(name)
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # binding.pry
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    # binding.pry
    @@all.sort_by {|song| song.name}
  end

  def self.filename_filer(filename)
    # put in a file name, returns an array with artist_name at [0] and song name at [1]
    song_array=[]
    song_array=filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    # binding.pry
    song_array
  end


  def self.new_from_filename(filename)
    #binding.pry
    temp_array=filename_filer(filename)
    #binding.pry
    song = self.new(temp_array[1], temp_array[0])

  end
#binding.pry
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end





end
