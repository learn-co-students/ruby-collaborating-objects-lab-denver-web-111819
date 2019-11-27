class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize name
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename filename
        song_and_name = filename.split(" - ")
        song = Song.new song_and_name[1]
        song.artist_name = song_and_name[0]
        song
    end

    def artist_name= name
        new_artist = Artist.find_or_create_by_name name
        self.artist = new_artist
        new_artist.add_song self
    end
end