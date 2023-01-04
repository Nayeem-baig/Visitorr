class VisitorsController < ApplicationController
  before_action :set_space
   def index
      @space = Space.where(user_id: current_user.id).first
      @visitors = @space.visitors.page(params[:page]).reverse_order
      if params[:search]
      @search_term = params[:search]
      @visitors = @visitors.search_by(@search_term)
      end
      if params[:date].to_s != ""
        begin
      @date = Date.parse(params[:date])
      @visitors = @visitors.where(created_at: @date.midnight..@date.end_of_day)
        rescue ArgumentError => e
      flash.now[:alert] = 'Invalid date!'
      redirect_to space_visitors_path(@space), status: :see_other
      return
    end
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
        render json: { status: 'failure', notice: @visitor.errors.objects.first.full_message }
      end
    end


    def check_out
      @visitor = @space.visitors.find(params[:id])
      @visitor.check_out = Time.now
      if @visitor.save
        redirect_to space_visitors_path(@space), status: :see_other
      else
        flash.now[:alert] = 'Some error occured!'
      end
    end


      def set_space
        @space = Space.where(user_id: current_user.id).first
      end
      private
        def visitors_params
          params.require(:visitor).permit(:name,:mob,:address,:resident_id,:reason,:check_in,:check_out)
        end
end
