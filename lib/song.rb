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
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    found ? found : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song_info = filename.split(".")[0].split(" - ")
    song = self.new
    song.name = song_info[1]
    song.artist_name = song_info[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
