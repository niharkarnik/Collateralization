class VavailablecollateralsController < ApplicationController
  def index
    @vavailablecollaterals = Vavailablecollateral.all
  end
end
