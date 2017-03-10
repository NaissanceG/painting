class PaintingsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_painting, only: [:show, :edit, :update, :destroy]
  before_action :owned_painting, only: [:edit, :update, :destroy]

  def index
    @paintings = Painting.all
  end

  def show
  end

  def new
    @painting = current_user.paintings.build
  end

  def edit
  end

  def create
    @painting = current_user.paintings.build(painting_params)
    if @painting.save
      flash[:success] = "Your painting is added!"
      redirect_to paintings_path
    else
      flash[:alert] = "Oops, something went wrong. Please try again."
      render :new
    end
  end

  def update
    if @painting.update(painting_params)
      flash[:success] = "Painting updated."
      redirect_to painting_path(@painting)
    else
      flash[:alert] = "Update failed. Please try again."
      render :edit
    end
  end

  def destroy
    @painting.destroy
    flash[:notice] = "Your painting was deleted!"
    redirect_to paintings_path
  end

  private

  def painting_params
    params.require(:painting).permit(:artist, :image, :condition, :price)
  end

  def set_painting
    @painting = Painting.find(params[:id])
  end

  def owned_painting
    unless current_user == @painting.user
      flash[:alert] = "Oops, you got the wrong painting.. you can only access your own paintings. Try again."
      redirect_to root_path
    end
  end

end
