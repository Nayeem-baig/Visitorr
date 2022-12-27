class ResidentsController < ApplicationController
  before_action :set_space
    def index
      @space = Space.find(params[:space_id])
      # if params[:search]
      #   @search_term = params[:search]
      #   @space = @space.search_by(@search_term)
      # end
    end
    
    def create
        @space = Space.find(params[:space_id])
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
    
        if @resident.update(resident_params)
          redirect_to @resident
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @resident = @space.residents.find(params[:id])
        @resident.destroy
        # redirect_to space_path(@space), status: :see_other
        redirect_to space_residents_path(@space), status: :see_other
      end
      def set_space
        @space = Space.find(params[:space_id])
      end
      private
        def residents_params
          params.require(:resident).permit(:name, :mob ,:email ,:flat)
        end
end
