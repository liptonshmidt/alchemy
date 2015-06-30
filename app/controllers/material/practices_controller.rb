class Material::PracticesController < ApplicationController
  before_action :require_login
  before_action :find_material

  def create
    @material.practice
    redirect_to practice_path
  end

  private

  def find_material
    @material = current_user.find_material params[:material_id]
  end
end
