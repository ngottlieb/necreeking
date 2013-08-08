class ReportsController < ApplicationController
  def index
    if current_user and current_user.regions.count > 0
      regions = current_user.regions.map { |r| r.id }
      @reports = Report.where(region_id: regions).limit(3)
    else
      @reports = Report.all
    end
  end

  def new
    @report = Report.new
  end

end
