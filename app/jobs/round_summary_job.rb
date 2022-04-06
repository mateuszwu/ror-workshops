class RoundSummaryJob < ApplicationJob
  queue_as :default

  def perform(round)
    @matches.each do |match|
      match.bets.each do |bet|
        @winner= match.home_team_score>match.away_team_score ? 1 : 0
        @betted_winner=bet.home_team_score>bet.away_team_score ? 1 : 0
        if bet.home_team_score==match.home_team_score && bet.away_team_score==match.away_team_score
          bet.update(points: 3)
        elsif @winner==@betted_winner
          bet.update(points:1)
        else
          bet.update(result: 0)
        end
      end
    end

  end
end
