class CollateralController < ApplicationController
  def edit
    @collateral = Collateral.find(params[:id])
  end

  def new
    @collateral = Collateral.find(params[:id])
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

  private
    def collateral_params
      params.require(:collateral).permit(:id, :field1, :field2, :field3, :field4, :field5, :quantity, :amount)
    end

end
