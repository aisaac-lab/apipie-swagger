class TodosController < ApplicationController
  include Swagger::Blocks

  before_action :set_todo, only: [:show, :update, :destroy]

  swagger_path '/todos' do

    operation :get do
      key :description, 'Get all todos'
      key :operationId, :find_todos

      response 200 do
        key :description, 'Todos'
        schema do
          key :required, [:id, :title, :created_by]
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :title do
            key :type, :string
          end
          property :created_by do
            key :type, :string
          end
        end
      end
    end
  end

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
