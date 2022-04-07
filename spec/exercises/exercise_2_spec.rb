# Exercise 2 - Mocks and yields
# - Implement class that fulfills requirements provided in tests
# - Tests cannot be changed

# References
# https://www.rubyguides.com/2019/12/yield-keyword/
# https://ruby-doc.org/core-2.5.0/Array.html#method-i-reject-21
# https://ruby-doc.org/core-2.5.0/Array.html#method-i-sort-21
# https://relishapp.com/rspec/rspec-expectations/v/3-10/docs/built-in-matchers/yield-matchers
# https://relishapp.com/rspec/rspec-mocks/v/3-10/docs/verifying-doubles/using-an-instance-double
# https://relishapp.com/rspec/rspec-mocks/v/3-10/docs/configuring-responses/returning-a-value
# https://relishapp.com/rspec/rspec-mocks/v/3-10/docs/basics/allowing-messages
# https://relishapp.com/rspec/rspec-mocks/v/3-10/docs/basics/test-doubles

# Dependencies (Do not change)

class CinemaCityWrapper
  # Do not provide implementation for this class
  def self.this_week_movies
  end
end

class IMDBWrapper
  # Do not provide implementation for this class
  def movie_score(title)
  end
end

# Place implementation below

class TopMoviesThisWeekCollection

  def each
    imdb_wrapper = IMDBWrapper.new
    movies = CinemaCityWrapper.this_week_movies
    movies_and_ratings = movies.map do |movie|
      {title: movie.title, rating: imdb_wrapper.movie_score(movie.title)}
    end
    
    movies_and_ratings.reject! { |hash| hash[:rating].nil?}
    movies_and_ratings.sort_by! { | hash | -hash[:rating] }    
    movies_and_ratings.first(3).each { | hash | yield hash[:title] }
  end

end

# Tests below
RSpec.describe TopMoviesThisWeekCollection do
  describe '#each' do
    it 'yields up to 3 top-ranked movies from cinema city this week' do
      allow(CinemaCityWrapper).to receive(:this_week_movies).and_return(
        [
          double(title: 'Kill Jill'),
          double(title: 'Elektronicky Mordulec 2'),
          double(title: 'Enczanto'),
          double(title: 'Breaking Good'),
          double(title: 'O jeden most za blisko')
        ]
      )
      imdb_wrapper = instance_double(IMDBWrapper)
      allow(IMDBWrapper).to receive(:new).and_return(imdb_wrapper)
      allow(imdb_wrapper).to receive(:movie_score).with('Kill Jill').and_return(2.0)
      allow(imdb_wrapper).to receive(:movie_score).with('Elektronicky Mordulec 2').and_return(3.5)
      allow(imdb_wrapper).to receive(:movie_score).with('Enczanto').and_return(1.0)
      allow(imdb_wrapper).to receive(:movie_score).with('Breaking Good').and_return(5.0)
      allow(imdb_wrapper).to receive(:movie_score).with('O jeden most za blisko').and_return(4.0)

      collection = TopMoviesThisWeekCollection.new

      expect { |b| collection.each(&b) }.to yield_successive_args(
                                              'Breaking Good',
                                              'O jeden most za blisko',
                                              'Elektronicky Mordulec 2'
                                            )
      expect { |b| collection.each(&b) }.to yield_control.exactly(3).times
    end

    context 'when there is no score for given movie' do
      it 'is not returned in results' do
        allow(CinemaCityWrapper).to receive(:this_week_movies).and_return(
          [
            double(title: 'Kill Jill'),
            double(title: 'Elektronicky Mordulec 2'),
            double(title: 'Enczanto')
          ]
        )
        imdb_wrapper = instance_double(IMDBWrapper)
        allow(IMDBWrapper).to receive(:new).and_return(imdb_wrapper)
        allow(imdb_wrapper).to receive(:movie_score).with('Kill Jill').and_return(2.0)
        allow(imdb_wrapper).to receive(:movie_score).with('Elektronicky Mordulec 2').and_return(nil)
        allow(imdb_wrapper).to receive(:movie_score).with('Enczanto').and_return(2.5)
        collection = TopMoviesThisWeekCollection.new

        expect { |b| collection.each(&b) }.to yield_successive_args('Enczanto', 'Kill Jill')
        expect { |b| collection.each(&b) }.to yield_control.exactly(2).times
      end
    end
  end
end
