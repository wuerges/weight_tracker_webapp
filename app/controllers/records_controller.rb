class RecordsController < ApplicationController
  # GET /records
  def index
    @record = Record.new
    @records = Record.order("created_at desc")
    @record.weight =  @records.first ? @records.first.weight : 100
  end

  # POST /records
  def create
    @record = Record.new(record_params)

    respond_to do |format|
      if @record.save
        format.js
      end
    end
  end

  # DELETE /records/1
  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:weight)
    end
end
