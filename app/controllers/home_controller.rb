class HomeController < ApplicationController
  def index
    @reports = Report.all
  end
  def how_it_works
  end
end
