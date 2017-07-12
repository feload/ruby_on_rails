class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end
  
  def show
    @todo = Todo.find(params[:id])
  end
  
  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:notice] = "Todo item updated correctly."
      redirect_to todo_path(@todo)
    else
      render "edit"
    end
  end
  
  def edit
    @todo = Todo.find(params[:id])
  end
  
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Post created correctly."
      redirect_to todo_path(@todo)
    else
      render "new"
    end
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end