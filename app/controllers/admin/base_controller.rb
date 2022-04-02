module Admin
  class BaseController < ApplicationController
    before_action :authorize_admin!

    private

    def authorize_admin!
      render_404 unless current_user&.admin?
    end

    def render_404
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end
end