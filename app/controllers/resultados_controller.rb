class ResultadosController < ApplicationController
  def index
    @resultados = Resultado.all
  end
  
  def show
    @resultado = Resultado.find(params[:id])
  end
  
  def new
    @resultado = Resultado.new
  end
  
  def create
    @resultado = Resultado.new(params[:resultado])
    if @resultado.save
      flash[:notice] = "Successfully created resultado."
      redirect_to @resultado
    else
      render :action => 'new'
    end
  end
  
  def edit
    @resultado = Resultado.find(params[:id])
  end
  
  def update
    @resultado = Resultado.find(params[:id])
    if @resultado.update_attributes(params[:resultado])
      flash[:notice] = "Successfully updated resultado."
      redirect_to @resultado
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @resultado = Resultado.find(params[:id])
    @resultado.destroy
    flash[:notice] = "Successfully destroyed resultado."
    redirect_to resultados_url
  end
end
