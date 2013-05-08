class ReportsController < ApplicationController
  def index
    @reports = Report.page params[:page]
  end

  def new
    @report = Report.new
  end

end
