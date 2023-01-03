class DashboardController < ApplicationController
    def index
        @space = Space.where(user_id: current_user.id).first
    end
end
