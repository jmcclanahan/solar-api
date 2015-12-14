class CompaniesController < ApplicationController
  include ErrorSerializer
  before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies/byState/1
  # GET /companies/byState/1.json
  def byState
    @companies = Company.where("state_id = ?", company_params[:state_id])

    render json: @companies
  end

  # GET /companies/byId/1
  # GET /companies/byId/1.json
  def byId
    @company = Company.find(company_params[:id])

    render json: @company
  end

  # GET /copmanies/search
  def search
    @companySearchResults = Company.company_search(company_params)

    render json: @companySearchResults.to_json(:include => {:domicile_type =>
      {:only => :domicile_type_desc}, :state => {:only => :state_desc}})
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params[:company])
    @companyAuthority = @company.company_authority.new(company_params[:company_authority])

    if (!company_params[:lobs].blank?)
      company_params[:lobs].each do |lob|
        @companyAuthority.lob.new(lob)
      end
    end

    if @company.save
      render json: @company, status: :created, location: @company
    else
      render json: ErrorSerializer.serialize(@company.errors), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @company = Company.find(company_params[:id])

    if @company.update(company_params)
      head :no_content
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy

    head :no_content
  end

  private

    def set_company
      @company = Company.find(company_params[:id])
    end

    def company_params
      params.permit(:id, :name, :fein, :domicile_type_id, :country_id, :state_id, :company_type,
                    company: [:id, :name, :short_name, :fein, :date_of_incorp, :domicile_type_id, :country_id, :state_id],
                    company_authority: [:company_type_id, :effective_date, :expiration_date, :issue_date],
                    lobs: [:line_type_id, :effective_date])
    end
end
