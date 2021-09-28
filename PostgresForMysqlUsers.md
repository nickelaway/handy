## show databases
\l

## Use foo
\c foo

## show schemas
\dn

## show tables in schema foo
\dt foo.*

## describe table bar in schema foo
\d foo.bar

## use schema foo 
set search_path to foo;

## Show results line by line (like \G)
\x on

## Disable paging of results
\pset pager off

## Show query times
\timing

## useful commands
https://gist.github.com/rgreenjr/3637525

## Check if Autovacuum is enabled
select name,setting from pg_settings where name in ('autovacuum', 'track_counts');

bash-5.0# ps -ef | grep vacuum
   49 postgres  0:00 postgres: autovacuum launcher   

## Vacuum and Analyse stats
SELECT schemaname,relname,autovacuum_count,vacuum_count,last_vacuum,last_autovacuum,autoanalyze_count,analyze_count,last_analyze,last_autoanalyze,n_mod_since_analyze  FROM pg_stat_user_tables;


## Show status of ongoing vacuum
select * from pg_stat_progress_vacuum

## Show number of dead tuples
SELECT relname, n_dead_tup FROM pg_stat_user_tables;


## Show correlation
select * from pg_stats where tablename = 'my_table' and attname = 'my_col';

## disable sequence scans (to force use of an index)
SET enable_seqscan = off;

## Show indexes
select * from pg_indexes where schemaname='foo';

## Show index size
select pg_size_pretty(pg_relation_size('my_schema.my_index_name'));
