class CompanyTypesController < ApplicationController
  before_action :set_company_type, only: [:show, :update, :destroy]

  # GET /company_types
  # GET /company_types.json
  def index
    @company_types = CompanyType.all

    render json: @company_types
  end

  # GET /company_types/byState/1
  # GET /company_types/byState/1.json
  def byState
    @company_types = CompanyType.where("state_id = ?", company_type_params[:state_id])

    render json: @company_types
  end

  # GET /company_types/1
  # GET /company_types/1.json
  def show
    render json: @company_type
  end

  # POST /company_types
  # POST /company_types.json
  def create
    @company_type = CompanyType.new(company_type_params)

    if @company_type.save
      render json: @company_type, status: :created, location: @company_type
    else
      render json: @company_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /company_types/1
  # PATCH/PUT /company_types/1.json
  def update
    @company_type = CompanyType.find(params[:id])

    if @company_type.update(company_type_params)
      head :no_content
    else
      render json: @company_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /company_types/1
  # DELETE /company_types/1.json
  def destroy
    @company_type.destroy

    head :no_content
  end

  private

    def set_company_type
      @company_type = CompanyType.find(params[:id])
    end

    def company_type_params
      params.permit(:company_type_code, :company_type_desc, :isactive, :state_id)
    end
end
