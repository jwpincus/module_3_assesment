class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    Item.create(item_params)
  end

  def destroy
    Item.delete(params[:id])
  end
  private

  def item_params
    params.permit(:name, :description, :image_url)
  end
end
