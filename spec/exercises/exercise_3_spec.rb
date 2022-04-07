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
    context 'when team_home and team_away are different' do
      it 'return false' do
        round_1 = Round.create(year: 2019, number: 1)
        team_a= Team.create(name: 'Team 1')
        #team_b= Team.create(name: 'Team 2')
        match_1 = Match.new(home_team_id: team_a.id, away_team_id: team_a.id, round_id: round_1.id, match_date: Date.tomorrow)
        expect(match_1.valid?).to be false
      end
    end
    context 'when team_home and team_away are not different' do
      it 'return true' do
        round_1 = Round.create(year: 2022 , number: 1000)
        team_a= Team.create(name: 'Team 1')
        team_b= Team.create(name: 'Team 2')
        match_1 = Match.new(home_team_id: team_a.id, away_team_id: team_b.id, round_id: round_1.id, match_date: Date.tomorrow)
        expect(match_1.valid?).to be true
      end
    end
  end
end
