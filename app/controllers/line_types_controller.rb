class LineTypesController < ApplicationController
  before_action :set_line_type, only: [:show, :update, :destroy]

  # GET /line_types
  # GET /line_types.json
  def index
    @line_types = LineType.all

    render json: @line_types
  end

  # GET /line_types/byState/1
  # GET /line_types/byState/1.json
  def byState
    @line_types = LineType.where("state_id = ?", line_type_params[:state_id])

    render json: @line_types
  end

  # GET /line_types/1
  # GET /line_types/1.json
  def show
    render json: @line_type
  end

  # POST /line_types
  # POST /line_types.json
  def create
    @line_type = LineType.new(line_type_params)

    if @line_type.save
      render json: @line_type, status: :created, location: @line_type
    else
      render json: @line_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /line_types/1
  # PATCH/PUT /line_types/1.json
  def update
    @line_type = LineType.find(params[:id])

    if @line_type.update(line_type_params)
      head :no_content
    else
      render json: @line_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /line_types/1
  # DELETE /line_types/1.json
  def destroy
    @line_type.destroy

    head :no_content
  end

  private

    def set_line_type
      @line_type = LineType.find(params[:id])
    end

    def line_type_params
      params.permit(:line_type_desc, :line_type_code, :state_id)
    end
end
