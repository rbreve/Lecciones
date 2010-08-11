class EmpresarialSectorsController < ApplicationController
  def index
    @empresarial_sectors = EmpresarialSector.all
  end
  
  def show
    @empresarial_sector = EmpresarialSector.find(params[:id])
  end
  
  def new
    @empresarial_sector = EmpresarialSector.new
  end
  
  def create
    @empresarial_sector = EmpresarialSector.new(params[:empresarial_sector])
    if @empresarial_sector.save
      flash[:notice] = "Sector Empresarial creado con éxito"
      redirect_to @empresarial_sector
    else
      render :action => 'new'
    end
  end
  
  def edit
    @empresarial_sector = EmpresarialSector.find(params[:id])
  end
  
  def update
    @empresarial_sector = EmpresarialSector.find(params[:id])
    if @empresarial_sector.update_attributes(params[:empresarial_sector])
      flash[:notice] = "Sector Empresarial actualizado con éxito"
      redirect_to @empresarial_sector
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @empresarial_sector = EmpresarialSector.find(params[:id])
    @empresarial_sector.destroy
    flash[:notice] = "Sector Empresarial Eliminado"
    redirect_to empresarial_sectors_url
  end
end
