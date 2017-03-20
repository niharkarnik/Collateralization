select 'total', comparefield, sum(source_qty), sum(source_amount),
	 sum(collateral_qty), sum(collateral_amount)
		from 
		(
		select 'source', comparefield,
			sum(quantity) as source_qty, sum(amount) as source_amount, 
		0 as collateral_qty, 0 as collateral_amount from 
        sources
		group by comparefield

		union 
		select 'collateral', comparefield, 0 as source_qty, 0 as source_amount,
		sum(quantity) as collateral_qty, sum(amount) as collateral_amount 
        from collaterals
		where margintype = 'I'
		group by comparefield
		) base_data
		group by comparefield;
         




		select 'sources', id, comparefield,
			 unalloc_source_quantity
			, amount 
		from (
        select id, comparefield,  
			 case when (quantity - coalesce(alloc_marg.collateralallocquantity,0))  <= 0 then 0
				  else (quantity - coalesce(alloc_marg.collateralallocquantity,0)) 
			 end  unalloc_source_quantity

            , amount 
		from sources src_data
        left outer join (
				select source_id, 
					sum(collateralallocquantity) as collateralallocquantity
					from allocsources
					group by source_id) alloc_marg
				 on src_data.id = alloc_marg.source_id
						
		where comparefield = 'A|B|C'
          ) as unalloc_source
         where unalloc_source_quantity > 0
          order by comparefield, unalloc_source_quantity;





		select 'collaterals', id, comparefield, margintype,
         case when (quantity - coalesce(alloc_marg.collateralallocquantity,0))  <= 0 then 0
              else (quantity - coalesce(alloc_marg.collateralallocquantity,0)) 
		 end  avail_collateral_quantity
         , amount as collateral_amount
         
		from collaterals col_data
        left outer join    
			(select collateral_id, 
				sum(collateralallocquantity) as collateralallocquantity
                from allocsources 
                group by collateral_id) alloc_marg
             on col_data.id = alloc_marg.collateral_id
             
		where comparefield = 'A|B|C'
          and margintype 	= 'I'
          order by comparefield, field1, field2, field3, avail_collateral_quantity, amount;

select * from v_available_collateral;
select * from v_under_allocated_source;

select * from tst.sources;
call tst.sp_init_source_collateral_compare_columns;
select * from tst.sources;

CALL `tst`.`sp_init_source_collateral_compare_columns`();

call tst.sp_allocation('I');
call tst.sp_allocation('V');


select * from vavailablecollaterals;
select * from vunderallocatedsources;


call sp_init_source_collateral_compare_columns();


