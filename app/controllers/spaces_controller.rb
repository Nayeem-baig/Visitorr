class SpacesController < ApplicationController
  # before_action :set_space
  before_action :authenticate_user!

  def index
    # @spaces = Space.all
    @space = Space.where(user_id: current_user.id).first
    if @space == nil
      @disable_nav = true
    end
    # if params[:search]
    #   @search_term = params[:search]
    #   @spaces = @spaces.search_by(@search_term)
    # end
  end

  def show
    @disable_nav = false
    @space = Space.find(params[:id])
  end
  def new
    @disable_nav = true
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @disable_nav = true
    @space.user_id = current_user.id
    if @space.save
      redirect_to @space
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @space = Space.find(params[:id])
  end

  def update
    @space = Space.find(params[:id])

    if @space.update(space_params)
      redirect_to @space
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @space = Space.find(params[:id])
    @space.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def space_params
      params.require(:space).permit(:name, :address)
    end
end
