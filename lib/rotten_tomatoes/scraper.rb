class Scraper

  ROTTEN_TOMATOES_URL = "https://www.rottentomatoes.com"
  
  def self.scrape_rt
    html = open('https://www.rottentomatoes.com/top/bestofrt/')

    doc = Nokogiri::HTML(html)
    
    doc.css(".table tr")[1..101].each   do |movie_doc|
      title = movie_doc.css("td")[2].text.strip
      url = movie_doc.css("td")[2].css("a").attr("href").value
      Movie.new(title, url)
    end
  end

  def self.scrape_movie_details(movie)
    html = open(ROTTEN_TOMATOES_URL + movie.url)
    doc = Nokogiri::HTML(html)
    movie.critic_score = doc.css(".critic-score .meter-value")[0].text
    movie.audience_score = doc.css(".audience-score .meter-value")[0].text.strip
    
  end
end