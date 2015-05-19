class MaterialsController < ApplicationController
  def index
    @materials = Material.all
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    if @material.save
      redirect_to @material
    else
      render :new
    end
  end

  def show
    @material = Material.find(params[:id])
  end

  private

  def material_params
    params.require(:material).permit(:title)
  end
end
