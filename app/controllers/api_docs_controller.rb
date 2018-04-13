class ApiDocsController < ApplicationController
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0'
      key :title, 'API Sample App'
      key :description, 'API Sample App'
      contact name: 'hairgai'
      license name: 'MIT'
    end
    key :basePath, '/'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  SWAGGERED_CLASSES = [
    TodosController,
    Todo,
    self,
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
