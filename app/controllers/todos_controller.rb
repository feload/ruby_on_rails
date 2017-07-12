class TodosController < ApplicationController
  
  before_action :set_todo, only: [:show, :edit, :destroy, :update]
  
  def index
    @todos = Todo.all
  end
  
  def show
  end
  
  def destroy
    if @todo.destroy
      flash[:notice] = "Todo element destroyed correctly."
      redirect_to todos_path
    else
      render "index"
    end 
  end
  
  def update
    if @todo.update(todo_params)
      flash[:notice] = "Todo item updated correctly."
      redirect_to todos_path
    else
      render "edit"
    end
  end
  
  def edit
  end
  
  def new
    @todo = Todo.new
  end
  
  def delete_collection
    if params[:delete].nil? 
      redirect_to todos_path
    else
      params[:delete].each do |id, value|
        Todo.find(id).destroy
      end
      
      redirect_to todos_path
    end
  end
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Post created correctly."
      redirect_to todos_path
    else
      render "new"
    end
  end
  
  private
  
  def set_todo
    @todo = Todo.find(params[:id])
  end
  
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end