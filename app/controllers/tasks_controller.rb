class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)

    if @task.save
      redirect_to @list, notice: 'Tarefa adicionada com sucesso!'
    else
      render :new, alert: 'Erro ao adicionar tarefa.' # Redirecionando de volta ao form de criação
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to list_path(@task.list), notice: 'Tarefa atualizada com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to list_path(params[:list_id]), notice: 'Tarefa excluída com sucesso!'
  end

  private

  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
