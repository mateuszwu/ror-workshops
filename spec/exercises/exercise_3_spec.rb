require 'rails_helper'
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

RSpec.describe Match do
  describe 'team uniqueness' do
    team_one = Team.create(name: 'Real Madrid')
    team_two = Team.create(name: 'FC Barcelona')
    round_one = Round.create(year: 2022, number: 1)
    round_two = Round.create(year: 2022, number: 2)

    it 'has the same teams' do
      match = Match.new(home_team: team_one, away_team: team_one, round: round_one, match_date: '2022-12-12')

      expect(match).to_not be_valid
    end

    it 'has different teams' do
      match = Match.new(home_team: team_one, away_team: team_two, round: round_two, match_date: '2022-12-12')

      expect(match).to be_valid
    end
  end
end