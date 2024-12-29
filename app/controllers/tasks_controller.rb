class TasksController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @list = current_user.lists.find(params[:list_id])
    @task = Task.new
  end

  def create
    @list = current_user.lists.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    @task.user = current_user

    if @task.save
      redirect_to @list, notice: "Tarefa adicionada com sucesso!"
    else
      render :new, alert: "Erro ao adicionar tarefa."
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to list_path(@task.list), notice: "Tarefa atualizada com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to list_path(params[:list_id]), notice: "Tarefa excluída com sucesso!"
  end

  private

  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
