class MaterialsController < ApplicationController
  def index
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    @material.save!
    redirect_to @material
  end

  def show
    @material = Material.find(params[:id])
  end

  private

  def material_params
    params.require(:material).permit(:title)
  end
end
