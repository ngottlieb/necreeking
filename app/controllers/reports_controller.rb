class ReportsController < ApplicationController
  def index
  end

  def new
    @report = Report.new
  end

  def create
    phone = "(" + params[:From][2..4] + ")" + " " + params[:From][5..7] + "-" + params[:From][8..11]
    @report = Report.new(:report => params[:Body], :phone => phone)
    if @report.save
      redirect_to root_path, notice: "Report created"
    else
      render action: "new"
    end
  end
end
