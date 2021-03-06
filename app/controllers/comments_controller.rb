class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html {
            flash[:notice] = "Successfully created comment."
            redirect_to @comment
        }
        format.js  {render :layout => false }
      end
    else
      render :action => 'new'
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to @comment
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @lesson=@comment.lesson
    @comment.destroy
    flash[:notice] = "Comentario fue borrado."
    redirect_to lesson_path(@lesson)
  end
end
