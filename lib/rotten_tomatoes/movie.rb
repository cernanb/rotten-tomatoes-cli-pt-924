class Movie
    attr_accessor :title, :url, :critic_score, :audience_score

    @@all = []

    def initialize(title, url)
        @title = title
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

end
