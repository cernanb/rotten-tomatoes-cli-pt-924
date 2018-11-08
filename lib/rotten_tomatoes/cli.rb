class CLI

  def run 
    puts "Welcome to the Rotten Tomatoes Top 100 Movies!!!"

    Scraper.scrape_rt
   
    Movie.all.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.title}"
    end

    menu
  end

  def menu
    puts "Please select a movie to view it's details:"

    input = gets.chomp

    movie = Movie.all[input.to_i - 1]
    if movie 
      Scraper.scrape_movie_details(movie)
      puts "Here are the details for #{movie.title}"
      puts "Critic Score: #{movie.critic_score}"
      puts "Audience Score: #{movie.audience_score}"
    else
      puts "Invalid choice...please select again!"
    end
    menu
  end 
end

