class ListsController < ApplicationController
    def index
      @lists = List.all
    end
  
    def show
      @list = List.find(params[:id])
      @task = Task.new
    end
  
    def new
      @list = List.new
    end
  
    def create
      @list = List.new(list_params)
      if @list.save
        redirect_to @list, notice: 'Lista criada com sucesso!'
      else
        render :new
      end
    end
  
    def edit
      @list = List.find(params[:id])
    end
  
    def update
      @list = List.find(params[:id])
      if @list.update(list_params)
        redirect_to @list, notice: 'Lista atualizada com sucesso!'
      else
        render :edit
      end
    end
  
    def destroy
      @list = List.find(params[:id])
      @list.destroy
      redirect_to lists_path, notice: 'Lista excluída com sucesso!'
    end
  
    private
  
    def list_params
      params.require(:list).permit(:name)
    end
  end
  