-- Setup for SQL script by starting with a fresh database --
\i ./euro2012_data.sql;

-- Show match ID & player for players from Russia
SELECT matchid, player FROM goal WHERE teamid = 'GER';