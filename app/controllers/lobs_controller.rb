class LobsController < ApplicationController
  before_action :set_lob, only: [:show, :update, :destroy]

  # GET /lobs
  # GET /lobs.json
  def index
    @lobs = Lob.all

    render json: @lobs
  end

  # GET /lobs/1
  # GET /lobs/1.json
  def show
    render json: @lob
  end

  # POST /lobs
  # POST /lobs.json
  def create
    @lob = Lob.new(lob_params)

    if @lob.save
      render json: @lob, status: :created, location: @lob
    else
      render json: @lob.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lobs/1
  # PATCH/PUT /lobs/1.json
  def update
    @lob = Lob.find(params[:id])

    if @lob.update(lob_params)
      head :no_content
    else
      render json: @lob.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lobs/1
  # DELETE /lobs/1.json
  def destroy
    @lob.destroy

    head :no_content
  end

  private

    def set_lob
      @lob = Lob.find(params[:id])
    end

    def lob_params
      params.require(:lob).permit(:effective_date, :termination_date, :line_type_id, :company_authority_id)
    end
end
