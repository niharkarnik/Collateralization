class SourcesController < ApplicationController
  def edit
    @source = Source.find(params[:id])
  end

  def new
    @source=Source.new
  end

  def index
    @sources = Source.all
  end

  def show
    @source = Source.find(params[:id])
  end

  def create
    @source = Source.new(source_params)
    if @source.save
      redirect_to @source
    else
      render 'new'
    end
  end

  def update
    @source = Source.find(params[:id])
    if @source.update(source_params)
      redirect_to @source
    else
      render 'edit'
    end
  end

  def destroy
    @source=Source.find(params[:id])
    @source.destroy

    redirect_to sources_path
  end

  private
    def source_params
      params.require(:source).permit(:id, :field1, :field2, :field3,
       :field4, :field5, :quantity, :amount)
    end
end
