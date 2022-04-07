module Admin
  class AdminPanelController < BaseController
    def index
      @teams = Team.all
      @rounds = Round.all
      @matches = Match.all
    end
  end
end
