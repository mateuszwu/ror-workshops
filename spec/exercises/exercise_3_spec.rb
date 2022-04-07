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
    describe 'when home team is the same as away team' do
      it 'returns false' do
      team = Team.new(name: 'HA Muahaha')
      roundA = Round.create(year: 2022, number: 1)
      match = Match.new(home_team: team, away_team: team, round: roundA, match_date: '2022-01-01')

      expect(match.valid?).to eq false
      end
    end

    describe 'when home team is different from away team' do
      it 'should have empty errors array' do
        teamA = Team.create(name: "aaa")
        teamB = Team.create(name: "bbb")
        roundA = Round.create(year: 2022, number: 1)
        match = Match.new(home_team: teamA, away_team: teamB, round: roundA, match_date: '2022-01-01')

        expect(match.valid?).to eq true
      end
    end

    describe 'when matches are composed from same teams' do
      it 'returns false' do
        teamA = Team.new(name: "aaa")
        teamB = Team.new(name: "bbb")

        roundA = Round.create(year: 2022, number: 1)
        matchA = Match.new(home_team: teamA, away_team: teamB, round: roundA, match_date: '2022-01-01')

        roundA = Round.create(year: 2022, number: 1)
        matchB = Match.new(home_team: teamB, away_team: teamA, round: roundA, match_date: '2022-01-01')

        expect(matchA.valid?(matchB)).to eq false
      end
    end

    describe 'when matches are composed from different teams' do
      it 'should have empty errors array' do
        teamA = Team.create(name: "aaa")
        teamB = Team.create(name: "bbb")
        roundA = Round.create(year: 2022, number: 1)
        matchA = Match.new(home_team: teamA, away_team: teamB, round: roundA, match_date: '2022-01-01')

        teamC = Team.create(name: "ccc")
        teamD = Team.create(name: "ddd")
        roundB = Round.create(year: 2022, number: 1)
        matchB = Match.new(home_team: teamC, away_team: teamD, round: roundB, match_date: '2022-01-01')

        expect(matchA.valid?(matchB)).to eq true
      end
    end

    describe 'when home team is missing' do
      it 'returns false' do
        team = Team.new(name: 'HA Muahaha')
        roundA = Round.create(year: 2022, number: 1)
        match = Match.new(home_team: team, away_team: nil, round: roundA, match_date: '2022-01-01')

        expect(match.valid?).to eq false
      end
    end

    describe 'when away team is missing' do
      it 'returns false' do
        team = Team.new(name: 'HA Muahaha')
        roundA = Round.create(year: 2022, number: 1)
        match = Match.new(home_team: nil, away_team: team, round: roundA, match_date: '2022-01-01')

        expect(match.valid?).to eq false
      end
    end


  end
end
