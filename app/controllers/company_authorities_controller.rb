class CompanyAuthoritiesController < ApplicationController
  before_action :set_company_authority, only: [:show, :update, :destroy]

  # GET /company_authorities
  # GET /company_authorities.json
  def index
    @company_authorities = CompanyAuthority.all

    render json: @company_authorities
  end

  # GET /company_authorities/1
  # GET /company_authorities/1.json
  def show
    render json: @company_authority
  end

  # POST /company_authorities
  # POST /company_authorities.json
  def create
    @company_authority = CompanyAuthority.new(company_authority_params)

    if @company_authority.save
      render json: @company_authority, status: :created, location: @company_authority
    else
      render json: @company_authority.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /company_authorities/1
  # PATCH/PUT /company_authorities/1.json
  def update
    @company_authority = CompanyAuthority.find(params[:id])

    if @company_authority.update(company_authority_params)
      head :no_content
    else
      render json: @company_authority.errors, status: :unprocessable_entity
    end
  end

  # DELETE /company_authorities/1
  # DELETE /company_authorities/1.json
  def destroy
    @company_authority.destroy

    head :no_content
  end

  private

    def set_company_authority
      @company_authority = CompanyAuthority.find(params[:id])
    end

    def company_authority_params
      params.require(:company_authority).permit(:effective_date, :expiration_date, :issue_date, :company_id, :company_type_id)
    end
end
