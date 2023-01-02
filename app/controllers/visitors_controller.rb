class VisitorsController < ApplicationController
  before_action :set_space
   def index
    @space = Space.where(user_id: current_user.id).first
    @visitors = @space.visitors.page(params[:page])
     if params[:search]
      @search_term = params[:search]
      @visitors = @visitors.search_by(@search_term)
    end
   end
    def new
      @visitor = Visitor.new
    end
    def create
      require 'date'
      @space = Space.where(user_id: current_user.id).first
      @residents = @space.residents.all
      @visitor = @space.visitors.create(visitors_params)
      @visitor.check_in = Time.now
      if @space.save
        NotifyMailer.with(resident_email: @visitor.resident.email , visitor: @visitor).notify_resident.deliver_now
      redirect_to space_visitors_path(@space), status: :see_other
      else
        respond_to do |format|  format.html { redirect_to request.referer, alert: 'Add fields required!' } end
      end
    end
    def check_out
      @space = Space.where(user_id: current_user.id).first
      @visitor = @space.visitors.find(params[:id])
      @visitor.update(check_out: params[:check_out])
      redirect_to space_visitors_path(@space), status: :see_other
    end
      def set_space
        @space = Space.where(user_id: current_user.id).first
      end
      private
        def visitors_params
          params.require(:visitor).permit(:name,:mob,:address,:resident_id,:reason,:check_in,:check_out)
        end
end
