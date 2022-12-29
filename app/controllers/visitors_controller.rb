class VisitorsController < ApplicationController
  before_action :set_space
   def index
    @visitors = Space.find(params[:space_id])
   end
    def new
      @visitor = Visitor.new
    end
    def create
      require 'date'
      @space = Space.find(params[:space_id])
      @residents = @space.residents.all
      @visitor = @space.visitors.create(visitors_params)
      @visitor.check_in = DateTime.now
      if @space.save
      redirect_to space_visitors_path(@space), status: :see_other
      else
        respond_to do |format|  format.html { redirect_to request.referer, alert: 'Add fields required!' } end
      end
    end
      def set_space
        @space = Space.find(params[:space_id])
      end
      private
        def visitors_params
          params.require(:visitor).permit(:name,:mob,:address,:resident_id,:reason,:check_in,:check_out)
        end
end
