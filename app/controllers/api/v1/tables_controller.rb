class Api::V1::TablesController < ApplicationController
  
  def index
    render json: Table.all
  end
  
  def show
    render json: Table.find(params[:id])
  end
end
