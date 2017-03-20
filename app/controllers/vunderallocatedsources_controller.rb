class VunderallocatedsourcesController < ApplicationController
  def index
    @vunderallocatedsources = Vunderallocatedsource.all
  end
end
