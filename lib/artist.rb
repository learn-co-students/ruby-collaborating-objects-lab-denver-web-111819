class Artist

    attr_accessor :name
    
    @@all = []

    def initialize name
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song song
        song.artist = self
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def self.find_or_create_by_name name
        if all.find {|artist|artist.name == name}
            all.find {|artist|artist.name == name}
        else
            Artist.new name
        end
    end

    def print_songs
        songs.each do |song|
            puts song.name
        end
    end

end