class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.recent
  end

  def show
  end

  def new
    @task = Task.new
  end

  def confirm_new
    # 新規登録画面から受け取ったデータからタスクオブジェクトを作成
    @task = current_user.tasks.new(task_params)
    # 問題があれば新規登録画面に戻す
    render :new unless @task.valid?
  end

  def edit
  end

  def create
    @task = current_user.tasks.new(task_params)

    # 戻るボタンが押されたたら新規登録画面に戻る
    if params[:back].present?
      render :new
      return
    end

    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    @task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を更新しました。"
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
