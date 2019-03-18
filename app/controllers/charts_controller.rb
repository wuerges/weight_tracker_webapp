class ChartsController < ApplicationController
  def index
    @records = Record.order("created_at desc")
  end
end
