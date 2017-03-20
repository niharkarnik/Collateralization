class CollateralsController < ApplicationController
  def edit
    @collateral = Collateral.find(params[:id])
  end

  def new
    @collateral = Collateral.new
  end

  def index
    @collaterals = Collateral.all
  end

  def show
    @collateral = Collateral.find(params[:id])
  end

  def create
    @collateral = Collateral.new(collateral_params)
    if @collateral.save
      redirect_to @collateral
    else
      render 'new'
    end
  end

  def update
    @collateral = Collateral.find(params[:id])
    if @collateral.update(collateral_params)
      redirect_to @collateral
    else
      render 'edit'
    end
  end

  def destroy
    @collateral=Collateral.find(params[:id])
    @collateral.destroy

    redirect_to collaterals_path
  end

  private
    def collateral_params
      params.require(:collateral).permit(:field1, :field2, :field3,
       :field4, :field5, :margintype, :quantity, :amount)
    end
end
