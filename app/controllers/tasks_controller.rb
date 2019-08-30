# frozen_string_literal: true

# Tasks controller
class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @list = List.find(params[:list_id])
    @task = @list.tasks.all
    respond_to do |format|
      format.html
      format.json
      format.csv { send_data @task.to_csv }
    end
  end

  def show
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    respond_to do |format|
      format.html
      format.json
      format.csv { send_data @task.to_csv }
    end
  end

  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.create(task_params)
    redirect_to list_path(@list)
  end

  def edit
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to @list
    else
      render 'edit'
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to list_path(@list)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :date)
  end
end
