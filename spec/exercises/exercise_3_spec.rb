# Exercise 3 - Writing tests after
# - Implement tests for two features
#   - Validating team uniqueness
#   - Validating match uniqueness
# - Test "#valid?" method
# - Implementation cannot be changed

# References
# https://api.rubyonrails.org/v6.1.3/classes/ActiveModel/Errors.html#method-i-full_messages
# Always see your test RED

# Implement tests below

require 'rails_helper'

RSpec.describe Match do
  describe '#valid?' do
    it 'returns false if home_team and away_team are the same' do
      # arrange
      home_team = Team.new(name: 'Home Team')
      away_team = Team.new(name: 'Home Team')
      # act & assert
      expect(Match.create(home_team: home_team, away_team: away_team).valid?).to be false
    end

    it 'returns true if home_team and away_team are not same' do
      # arrange
      round = Round.create!(number: 1, year: 2022)
      home_team = Team.create!(name: 'Home Team')
      away_team = Team.create!(name: 'Away Team')

      # act & assert
      expect(
        Match.create!(
          round_id: round.id,
          home_team_id: home_team.id,
          away_team_id: away_team.id,
          match_date: Date.tomorrow
        ).valid?).to be true
    end
  end
end
