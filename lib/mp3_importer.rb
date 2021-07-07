class MP3Importer

    attr_accessor :path

    def initialize path
        @path = path
    end

    def files
        filenames = Dir.entries(self.path)
        filenames.shift
        filenames.shift
        filenames
    end

    def import
        files.map do |filename|
            Song.new_by_filename filename
        end
    end
end