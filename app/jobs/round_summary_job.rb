class RoundSummaryJob < ApplicationJob
  def perform(round)
    round.matches.each do |match|
      match.bets.each do |bet|
        points = if match.home_team_score == bet.home_team_score && match.away_team_score == bet.away_team_score
                   1
                 else
                   0
                 end
        bet.update(points: points)
      end
    end
  end
end