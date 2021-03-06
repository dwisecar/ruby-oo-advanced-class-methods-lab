require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name }
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(name)    
    self.find_by_name(name) || self.create_by_name(name)  
  end

  def self.alphabetical
    self.all.sort{|a, z|a.name <=> z.name}
  end

  def self.new_from_filename(file)
    song_file = file.split(" - ")
    song = self.new_by_name(song_file[1].split(".")[0])
    song.artist_name = song_file[0]
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end


end
