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

def valid_round
  Round.create(year: 2022, number:1, created_at:Date.today, updated_at:Date.today)
end

class TeamsFactory
  @@next_id = 1
  def self.build(name)
  @@next_id += 1
    Team.new(name: name, id: @@next_id)
  end

end

RSpec.describe Match do
  describe '#valid?' do
    it 'return false when home team is the same as away team' do  
      team = TeamsFactory.build(name: "Szermierka Kielce")
      expect(Match.new(id: 1, match_date:Date.today, round: valid_round, home_team: team, away_team: team)).to_not be_valid 
    end

    it 'return true when home team is diffrent than the away team' do  
      team1 = TeamsFactory.build(name: "Szermierka Kielce")
      team2 = TeamsFactory.build(name: "Rebel Fencing")
      expect(Match.new(id: 1, match_date:Date.today, round: valid_round, home_team: team1, away_team: team2)).to be_valid 
    end
  end
end

# 1) Match#valid? return true when home team is diffrent than the away team
# Failure/Error: expect(Match.new(round: valid_round, home_team: team1, away_team: team2)).to be_valid
#   expected #<Match id: nil, home_team_id: 1, away_team_id: 2, away_team_score: nil, home_team_score: nil, 
#   round_id: 1, match_date: nil, created_at: nil, updated_at: nil> to be valid, but got errors: Match date can't be blank