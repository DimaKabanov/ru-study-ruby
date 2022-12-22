module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        ratings = films
                  .reject { |film| film['country'].nil? }
                  .reject { |film| film['country'].strip.split(',').count < 2 }
                  .reject { |film| film['rating_kinopoisk'].to_i.zero? }
                  .map { |film| film['rating_kinopoisk'].to_f }

        ratings_sum = ratings.reduce(0) { |sum, rating| sum + rating }

        ratings_sum / ratings.count
      end

      def chars_count(films, threshold)
        films
          .filter { |film| film['rating_kinopoisk'].to_f >= threshold }
          .map { |film| film['name'] }
          .reduce(0) { |total_count, name| total_count + name.count('и') }
      end
    end
  end
end
