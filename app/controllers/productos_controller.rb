class ProductosController < ApplicationController
  def index
    @productos = Producto.all
  end
  
  def show
    @producto = Producto.find(params[:id])
  end
  
  def new
    @producto = Producto.new
  end
  
  def create
    @producto = Producto.new(params[:producto])
    if @producto.save
      flash[:notice] = "Successfully created producto."
      redirect_to @producto
    else
      render :action => 'new'
    end
  end
  
  def edit
    @producto = Producto.find(params[:id])
  end
  
  def update
    @producto = Producto.find(params[:id])
    if @producto.update_attributes(params[:producto])
      flash[:notice] = "Successfully updated producto."
      redirect_to @producto
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @producto = Producto.find(params[:id])
    @producto.destroy
    flash[:notice] = "Successfully destroyed producto."
    redirect_to productos_url
  end
end
