class AllocsourcesController < ApplicationController
  def index
    @allocsources = Allocsource.all
  end

  def show
    @allocsource = Allocsource.find(params[:id])
  end
end
