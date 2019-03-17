class RecordsController < ApplicationController
  # GET /records
  def index
    @record = Record.new
    last = Record.order("created_at").last
    @record.weight =  last ? last.weight : 100
    @records = Record.all
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
