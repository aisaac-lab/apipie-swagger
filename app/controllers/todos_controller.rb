class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  api :GET, '/todos', 'TODO一覧を返します'
  error code: 404, desc: 'Not Found'

  # GET /todos
  def index
    @todos = Todo.all
    json_response(@todos)
  end

  # POST /todos
  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  api :GET, '/todos/:id', '指定のIDのTODO情報を返します'
  description '指定のIDのTODO情報を返します'
  formats ['json']
  error code: 404, description: 'Not Found'
  error code: 400, description: 'Invalid parameter'

  # GET /todos/:id
  def show
    json_response(@todo)
  end

  # PUT /todos/:id
  def update
    @todo.update(todo_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def todo_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
