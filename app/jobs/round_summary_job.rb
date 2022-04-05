class RoundSummaryJob < ApplicationJob

    queue_as :default

    def perform(match)
      match.bets.each do |bet|
        award_points(bet, match)
      end
    end

    def award_points(bet, match)
        if bet.home_team_score == match.home_team_score && bet.away_team_score == match.away_team_score
           bet.points += 3
        elsif correct_winner?(bet, match)
            bet.points += 1
        end
        bet.save
    end

private
def correct_winner?(bet, match)
    if bet.home_team_score > bet.away_team_score && match.home_team_score > match.away_team_score
        retun true
    end
    if bet.home_team_score > bet.away_team_score && match.home_team_score > match.away_team_score 
        retun true
    end
    if bet.home_team_score == bet.away_team_score && match.home_team_score == match.away_team_score 
        retun True
    end
    retun false
end


end
