module Admin
  class AdminPanelController < BaseController
    def index
      @teams = Team.all
      @rounds = Round.all
    end
  end
end
