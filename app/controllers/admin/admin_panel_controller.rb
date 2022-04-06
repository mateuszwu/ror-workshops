module Admin
  class AdminPanelController < BaseController
    def index
      @teams = Team.all
    end
  end
end