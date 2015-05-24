class MaterialsController < ApplicationController
  before_action :require_login

  def index
    @materials = current_user.materials
  end

  def new
    @material = Material.new
  end

  def create
    @material = current_user.materials.new(material_params)
    if @material.save
      redirect_to @material
    else
      render :new
    end
  end

  def show
    @material = current_user.find_material(params[:id])
  end

  private

  def material_params
    params.require(:material).permit(:title)
  end
end
