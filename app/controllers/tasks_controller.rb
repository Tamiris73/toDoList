class TasksController < ApplicationController
  before_action :set_list, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_task, only: [:edit, :update, :destroy]

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.new(task_params)
    @task.user = current_user  

    if @task.save
      redirect_to @list, notice: "Tarefa adicionada com sucesso!"
    else
      render :new, alert: "Erro ao adicionar tarefa."
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to list_path(@task.list), notice: "Tarefa atualizada com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to list_path(@list), notice: "Tarefa excluída com sucesso!"
  end

  private

  def task_params
    params.require(:task).permit(:description, :completed)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
