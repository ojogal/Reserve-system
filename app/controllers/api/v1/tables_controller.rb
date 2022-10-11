class Api::V1::TablesController < ApplicationController
  before_action :set_table, only: %i[show update]
  before_action :check_owner, only: %i[update destroy]
  before_action :check_login, only: %i[create]
  
  def index
    render json: Table.all
  end
  
  def show
    render json: Table.find(params[:id])
  end

  def create
    table = current_user.tables.build(table_params)
    
    if table.save
      render json: table, status: :created
    else
      render json: { errors: table.errors }, status: :unprocessable_entity
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
