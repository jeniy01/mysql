desc tbl_member;

select * from tab where tabtype='TABLE';

select * from tab where tabtype='VIEW';

select table_name, index_name, column_name from all_ind_columns where table_OWNER='TEST1' and index_name like 'IDX%';

commit;