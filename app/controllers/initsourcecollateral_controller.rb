class InitsourcecollateralController < ApplicationController
  def index
    ActiveRecord::Base.connection.execute(
         "call `tst`.`sp_init_source_collateral_compare_columns`(0,1)"
                                         )
  end
end
