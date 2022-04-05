module RoundHelper
  def bet_link(match, user)
    bet = match.user_bet(user)
    if bet.present?
      link_to 'Bet', edit_round_match_bet_path(match.round, match, bet), class: 'btn btn-warning'
    else
      link_to 'Bet', new_round_match_bet_path(match.round, match), class: 'btn btn-success'
    end
  end
end
