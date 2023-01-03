class ResidentsController < ApplicationController
  before_action :set_space
    def index
      @space = Space.where(user_id: current_user.id).first
      @residents = @space.residents.page(params[:page])
      if params[:search]
        @search_term = params[:search]
        @residents = @residents.search_by(@search_term)
      end
    end
    
    def create
        @space = Space.where(user_id: current_user.id).first
        @resident = @space.residents.create(residents_params)
        redirect_to space_residents_path(@space), status: :see_other
        # redirect_to space_path(@space)
    end
    
    def show
      @resident = @space.residents.find(params[:id])
    end

    def edit
        @resident = @space.residents.find(params[:id])
    end
    
    def update
        @resident = @space.residents.find(params[:id])
    
      if @resident.update(residents_params)
          redirect_to space_residents_path(@space), status: :see_other
      else
          render :edit, status: :unprocessable_entity
      end
    end

      def destroy
        @resident = @space.residents.find(params[:id])
        @resident.destroy
        redirect_to space_residents_path(@space), status: :see_other
      end
      def set_space
        @space = Space.where(user_id: current_user.id).first
      end
      private
        def residents_params
          params.require(:resident).permit(:name, :mob ,:email ,:flat)
        end
end
