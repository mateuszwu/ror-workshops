class SummarizeRoundJob < ApplicationJob
  def perform(round)
    round.matches.each do |match|
      next if match.home_team_score.nil? || match.away_team_score.nil?

      match.bets.each do |bet|
        points = if user_guess_result?(match, bet)
                   3
                 elsif user_guess_winner?(match, bet)
                   1
                 else
                   0
                 end

        bet.update(points:)
      end
    end
  end

  private

  def user_guess_result?(match, bet)
    match.home_team_score == bet.home_team_score && match.away_team_score == bet.away_team_score
  end

  def user_guess_winner?(match, bet)
    match.home_team_score == match.away_team_score && bet.home_team_score == bet.away_team_score ||
      match.home_team_score > match.away_team_score && bet.home_team_score > bet.away_team_score ||
      match.home_team_score < match.away_team_score && bet.home_team_score < bet.away_team_score
  end
end
