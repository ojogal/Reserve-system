class Api::V1::TablesController < ApplicationController
  before_action :set_table, only: %i[show update]
  before_action :check_owner, only: %i[update destroy]
  before_action :check_login, only: %i[create]
  
  def index
    @tables = Table.all
    options = { include: [:user] }
    render json: Tableerializer.new(@tables, options).serializable_hash.to_json
  end
  
  def show
    options = { include: [:user] }
    render json: TableSerializer.new(@table, options).serializable_hash.to_json
  end

  def create
    table = current_user.tables.build(table_params)
    
    if table.save
      render json: TableSerializer.new(@tables).serializable_hash.to_json, status: :created
    else
      render json: { errors: table.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @table.update(user_params)
      render json: TableSerializer.new(@table).serializable_hash.to_json
    else
      render json: @table.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @table.destroy
    head 204
  end
  
  private
  def table_params
    params.require(:table).permit(:table, :seats)
  end

  def check_owner
    head :forbidden unless @table.user_id == current_user&.id
  end

  def set_table
    @table = table.find(params[:id])
  end
end
