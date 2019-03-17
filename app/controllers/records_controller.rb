class RecordsController < ApplicationController
  before_action :set_record, only: [:update, :destroy]

  # GET /records
  def index
    @records = Record.all
  end

  # POST /records
  def create
    @record = Record.new(record_params)
    dv = {'+' => 0.1, '-' => -0.1}[params[:button]]
    @record.weight += dv
        
    respond_to do |format|
      if @record.save
        format.js
      end
    end
  end

  # PATCH/PUT /records/1
  def update
    respond_to do |format|
      format.js {
        if @record = Record.find(params[:id])
            dv = {'+' => 0.1, '-' => -0.1}[params[:button]]
            @record.weight += dv
            @record.save
        end
      }
    end
  end

  # DELETE /records/1
  def destroy
    @record.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:weight)
    end
end
