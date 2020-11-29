require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name) 
    found ? found : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    parsed_filename = filename.split(" - ")
    artist = parsed_filename[0]
    title = parsed_filename[1].split(".")[0]
    song = self.new_by_name(title)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    parsed_filename = filename.split(" - ")
    artist = parsed_filename[0]
    title = parsed_filename[1].split(".")[0]
    song = self.create_by_name(title)
    song.artist_name = artist
    song
  end 

  def self.destroy_all
    self.all.clear
  end

end
