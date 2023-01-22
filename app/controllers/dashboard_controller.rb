class DashboardController < ApplicationController

  def index
    @copies = Copy.all
  end
end