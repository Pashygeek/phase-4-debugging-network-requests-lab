class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def show
    toy = find_toy
    render json: toy
  end

  def create
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = find_toy
    toy.update(toy_params)
    render json: toy
  end

  def destroy
    toy = find_toy
    toy.destroy
    head :no_content
  end

  def increment_likes
    toy = find_toy
    toy.update(likes: toy.likes + 1)
    render json: toy
  end

  private

  def toy_params
    params.permit(:name, :image, :likes)
  end

  def find_toy
    Toy.find(params[:id])
  end

end
