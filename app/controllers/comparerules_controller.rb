class ComparerulesController < ApplicationController
  def index
    @comparerules = Comparerule.all
  end
end
