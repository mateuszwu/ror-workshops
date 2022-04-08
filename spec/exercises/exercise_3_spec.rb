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
    context("Home team and away team are the same") do
      it("returns false") do
        home_team = Team.create({name: "Arsenal"})
        away_team = Team.create({name: "Arsenal"})
        expect(Match.create(match_date: Date.tomorrow, home_team_id: home_team.id, away_team_id: away_team.id, home_team: home_team, away_team: away_team, round_id: round.id)
      end
    end
    context("Home team and away team are already scheduled for this round") do
      it("returns true") do
        round = Round.create(year: 2022, number: 1);
        home_team = Team.create({name: "Arsenal"})
        away_team = Team.create({name: "Barcelona"})
        Match.create(match_date: Date.tomorrow, home_team_id: home_team.id, away_team_id: away_team.id, home_team: home_team, away_team: away_team, round_id: round.id)
        expect(Match.create(match_date: Date.(Date.today + 3.days), home_team_id: home_team.id, away_team_id: away_team.id, home_team: home_team, away_team: away_team, round_id: round.id).is_valid?).to be false
      end
    end
  end
end
