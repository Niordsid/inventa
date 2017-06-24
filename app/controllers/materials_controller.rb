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
      redirect_to articulos_path
    else
      render 'new'
    end
  end

  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    redirect_to articulos_path
  end


  private

    def material_params
      params.require(:material).permit(:nombre, :cantidad, :precio_venta, :precio_compra, :precio_transporte. :categoria_id)
    end
end
