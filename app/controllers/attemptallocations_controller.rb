class AttemptallocationsController < ApplicationController

  def index

#    ActiveRecord::Base.connection.execute("call `tst`.`sp_allocation_main`( )" )

    margin_type='I';
    ActiveRecord::Base.connection.execute("call `tst`.`sp_allocation`('#{margin_type}' )")
    ActiveRecord::Base.clear_active_connections!
#
    margin_type='V';
    ActiveRecord::Base.connection.execute("call `tst`.`sp_allocation`('#{margin_type}')")
    ActiveRecord::Base.clear_active_connections!

  end

  def call_sp_init
    mysql2.activerecord_class = Activerecord::Base
    DbStoredProcedure.fetch_db_records("exec `tst`.`sp_init_source_collateral_compare_columns`()")
  end

  def call_sp_2
    results = ActiveRecord::Base.connection.exec_query %Q{CALL sp_allocation('#{I}')}
    ActiveRecord::Base.clear_active_connections!

  end
end
