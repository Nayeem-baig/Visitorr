class DashboardController < ApplicationController
    def index
        @space = Space.find(params[:space_id])
    end
end
