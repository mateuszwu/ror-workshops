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
  describe '#valid?' do
    team_one = Team.create(name: 'Real Madryt')
    team_two = Team.create(name: 'FC Barcelona')
    round_one = Round.first_or_create!(year: 2022, number: 1)

    describe 'team uniqueness - match has the same team' do

      it 'should false' do
        match = Match.new(home_team: team_one, away_team: team_one, round: round_one, match_date: '2022-12-12')

        expect(match).to_not be_valid
      end
    end

    describe 'team uniqueness - match has the different teams' do
      it 'should be true' do

        match = Match.new(home_team: team_one, away_team: team_two, round: round_one, match_date: '2022-12-12')

        expect(match).to be_valid
      end
    end

    describe 'match uniqueness - matches at one day has the same teams' do

      it 'should false' do
        match_one = Match.create(home_team: team_two, away_team: team_one, round: round_one, match_date: '2022-12-13')
        match_two = Match.create(home_team: team_one, away_team: team_two, round: round_one, match_date: '2022-12-13')

        expect(match_two).to_not be_valid
      end
    end

    describe 'match has one team missing - home team' do
      it 'should false' do
        match_one = Match.new(away_team: team_one, round: round_one, match_date: '2022-12-14')

        expect(match_one).to_not be_valid
      end
    end

    describe 'match has one team missing - away team' do
      it 'should false' do
        match_one = Match.new(home_team: team_one, round: round_one, match_date: '2022-12-15')

        expect(match_one).to_not be_valid
      end
    end

    describe 'match is set correctly' do
      it 'should be true' do
        match_one = Match.new(home_team: team_two, away_team: team_one, round: round_one, match_date: '2022-12-16')

        expect(match_one).to be_valid
      end
    end
  end
end
