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
    it 'add correct match' do
      @team1=Team.create(:name=>'Fc Barca',
        :created_at=>2022-05-10, 
        :updated_at=>2022-05-10)
      @team2=Team.create(:name=>'Napoli',
        :created_at=>2022-05-10, 
        :updated_at=>2022-05-10)
      @round=Round.create(:year=>2022,
        :number=>1,
        :created_at=>2022-05-10, 
        :updated_at=>2022-05-10)
      expect(Match.new(:home_team_id=>@team1.id,
        :away_team_id=>@team2.id,
        :match_date=>2022-05-10,
        :round_id=>@round.id,
        :created_at=>2022-04-10,
        :updated_at=>2022-04-10).valid?).to eq true
    end
    it 'add the same team' do
      @team=Team.create(:name=>'Fc Barca',
        :created_at=>2022-05-10, 
        :updated_at=>2022-05-10)
      @round=Round.create(:year=>2022,
        :number=>1,
        :created_at=>2022-05-10, 
        :updated_at=>2022-05-10)
      expect(Match.new(:home_team_id=>@team.id,
        :away_team_id=>@team.id,
        :match_date=>2022-05-10,
        :round_id=>@round.id,
        :created_at=>2022-04-10,
        :updated_at=>2022-04-10).valid?).to eq false
    end
    # it 'set score before match day' do
    #   @team1=Team.create(:name=>'Fc Barca',
    #     :created_at=>2022-05-10, 
    #     :updated_at=>2022-05-10)
    #   @team2=Team.create(:name=>'Napoli',
    #     :created_at=>2022-05-10, 
    #     :updated_at=>2022-05-10)
    #   @round=Round.create(:year=>2022,
    #     :number=>1,
    #     :created_at=>2022-05-10, 
    #     :updated_at=>2022-05-10)
    #   expect(Match.new(:home_team_id=>@team2.id,
    #     :away_team_id=>@team1.id,
    #     :match_date=>2022-05-10,
    #     :round_id=>@round.id,
    #     :created_at=>2022-04-10,
    #     :updated_at=>2022-04-10,
    #     :away_team_score=>1,
    #     :home_team_score=>2).valid?).to eq false
    # end
  end
end


