class AmbitosController < ApplicationController
  def index
    @ambitos = Ambito.all
  end
  
  def show
    @ambito = Ambito.find(params[:id])
  end
  
  def new
    @ambito = Ambito.new
  end
  
  def create
    @ambito = Ambito.new(params[:ambito])
    if @ambito.save
      flash[:notice] = "Ambito creado con éxito"
      redirect_to @ambito
    else
      render :action => 'new'
    end
  end
  
  def edit
    @ambito = Ambito.find(params[:id])
  end
  
  def update
    @ambito = Ambito.find(params[:id])
    if @ambito.update_attributes(params[:ambito])
      flash[:notice] = "Ambito actualizado con éxito"
      redirect_to @ambito
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @ambito = Ambito.find(params[:id])
    # @ambito.destroy
    flash[:notice] = "Ambito deshabilitado"
    redirect_to ambitos_url
  end
end
