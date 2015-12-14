class DomicileTypesController < ApplicationController
  before_action :set_domicile_type, only: [:show, :update, :destroy]

  # GET /domicile_types
  # GET /domicile_types.json
  def index
    @domicile_types = DomicileType.all

    render json: @domicile_types
  end

  # GET /domicile_types/byState/1
  # GET /domicile_types/byState/1.json
  def byState
    @domicile_types = DomicileType.where("state_id = ?", domicile_type_params[:state_id])

    render json: @domicile_types
  end

  # GET /domicile_types/1
  # GET /domicile_types/1.json
  def show
    render json: @domicile_type
  end

  # POST /domicile_types
  # POST /domicile_types.json
  def create
    @domicile_type = DomicileType.new(domicile_type_params)

    if @domicile_type.save
      render json: @domicile_type, status: :created, location: @domicile_type
    else
      render json: @domicile_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /domicile_types/1
  # PATCH/PUT /domicile_types/1.json
  def update
    @domicile_type = DomicileType.find(params[:id])

    if @domicile_type.update(domicile_type_params)
      head :no_content
    else
      render json: @domicile_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /domicile_types/1
  # DELETE /domicile_types/1.json
  def destroy
    @domicile_type.destroy

    head :no_content
  end

  private

    def set_domicile_type
      @domicile_type = DomicileType.find(params[:id])
    end

    def domicile_type_params
      params.permit(:domicile_type_code, :domicile_type_desc, :state_id)
    end
end
