class ReportsController < ApplicationController
  def index
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(params[:report])
    if @report.save
      redirect_to root_path, notice: "Report created"
    else
      render action: "new"
    end
  end
end
